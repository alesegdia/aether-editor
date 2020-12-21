// Dear ImGui: standalone example application for Allegro 5
// If you are new to Dear ImGui, read documentation from the docs/ folder + read the top of imgui.cpp.
// Read online: https://github.com/ocornut/imgui/tree/master/docs

#include "imgui.h"
#include "imgui_impl_allegro5.h"
#include <L2DFileDialog/src/L2DFileDialog.h>
#include <aether/aether.h>
#include <memory>


class SCR : public aether::core::IScreen {
public:
    SCR() {}
    ~SCR() override = default;

    void show() override {}
    void hide() override {}
    void update(uint64_t) override {}
    void render() override
    {
        char buffer[512];
        FileDialog::fileDialogOpen = true;
        auto opened = true;
        FileDialog::ShowFileDialog(&opened, buffer, 512);

        ImGui::Begin("Hello, world!");                          // Create a window called "Hello, world!" and append into it.
        ImGui::End();
    }

private:

};


std::shared_ptr<aether::core::IScreen> aether_boot_screen()
{
    return std::make_shared<SCR>();
}