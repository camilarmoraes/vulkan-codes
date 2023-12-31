#pragma once

#include "lve_device.hpp"
#include "lve_window.hpp"
#include "lve_pipeline.hpp"
#include "lve_game_object.hpp"
#include "lve_renderer.hpp"
#include "lve_descriptors.hpp"

#include <memory>
#include <vector>

namespace lve{
    
    class FirstApp{

        public:
            static constexpr int WIDTH = 800;
            static constexpr int HEIGHT = 600;

            FirstApp();
            ~FirstApp();

            FirstApp(const LveWindow &) = delete;
            FirstApp &operator=(const LveWindow &) = delete;

            void run();
        private:
            void loadGameObjects();

            LveWindow lveWindow{WIDTH, HEIGHT,  "App Vulkan"};
            LveDevice lveDevice{lveWindow};
            LveRenderer lveRenderer{lveWindow, lveDevice};

            // a ordem de declaração importa!
            std::unique_ptr<LveDescriptorPool> globalPool{};
            LveGameObject::Map gameObjects;

    };
}