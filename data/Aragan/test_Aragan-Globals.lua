-- test_Aragan-Globals.lua
local busted = require("busted")
local globals = require("Aragan-Globals") -- Adjust the path if necessary

describe("Aragan-Globals Tests", function()

    it("should initialize latency correctly", function()
        assert.is_number(latency)
        assert.is_true(latency > 0)
    end)

    it("should include necessary files", function()
        assert.has_no.errors(function()
            include('SCH_soloSC.lua')
            include('common_info.skillchain.lua')
        end)
    end)

    it("should set default state values", function()
        assert.is_true(state.DisplayMode.value)
        assert.is_false(state.ReEquip.value)
        assert.is_true(state.AutoArts.value)
        assert.is_true(state.AutoLockstyle.value)
    end)

    it("should handle user commands", function()
        assert.has_no.errors(function()
            user_self_command({"ascws", "Savage Blade"})
        end)
    end)

    it("should handle user zone changes", function()
        assert.has_no.errors(function()
            user_zone_change(123, 456)
        end)
    end)

    it("should handle user target changes", function()
        assert.has_no.errors(function()
            user_target_change({name = "Test Target"})
        end)
    end)

    it("should handle buff changes", function()
        assert.has_no.errors(function()
            user_buff_change("Amnesia", true)
            user_buff_change("Amnesia", false)
        end)
    end)

    it("should handle auto-trust logic", function()
        assert.has_no.errors(function()
            check_trust()
        end)
    end)

    it("should handle auto-buy auction house logic", function()
        assert.has_no.errors(function()
            purchase_group("Echa Zitah")
        end)
    end)

    it("should handle auto-trade logic", function()
        assert.has_no.errors(function()
            start_autotrade("zitah")
            stop_autotrade()
        end)
    end)

    it("should handle moon phase changes", function()
        assert.has_no.errors(function()
            check_new_moon()
        end)
    end)

    it("should handle day changes", function()
        assert.has_no.errors(function()
            check_darkday()
        end)
    end)

end)