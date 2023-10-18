#pragma once

#include "lve_window.hpp"
#include "lve_pipeline.hpp"
#include "lve_device.hpp"
#include "lve_swap_chain.hpp"
#include "lve_model.hpp"

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
            void loadModels();
            void createPipelineLayout();
            void createPipeline();
            void createCommandBuffers();
            void freeCommandBuffers();
            void drawFrame();
            void recreateSwapChain();
            void recordCommandBuffer(int imageIndex);


            LveWindow lveWindow{WIDTH, HEIGHT,  "hello"};
            LveDevice lveDevice{lveWindow};
            std::unique_ptr<LveSwapChain> lveSwapChain;
            std::unique_ptr<LvePipeline> lvePipeline; //vector <memory>
            VkPipelineLayout pipelineLayout;
            std::vector<VkCommandBuffer> commandBuffers;
            std::unique_ptr<LveModel> lveModel;

    };
}