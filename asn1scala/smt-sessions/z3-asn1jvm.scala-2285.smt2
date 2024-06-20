; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57938 () Bool)

(assert start!57938)

(declare-fun res!222145 () Bool)

(declare-fun e!185854 () Bool)

(assert (=> start!57938 (=> (not res!222145) (not e!185854))))

(declare-datatypes ((array!14818 0))(
  ( (array!14819 (arr!7448 (Array (_ BitVec 32) (_ BitVec 8))) (size!6461 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11736 0))(
  ( (BitStream!11737 (buf!6929 array!14818) (currentByte!12817 (_ BitVec 32)) (currentBit!12812 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11736)

(declare-fun w2!580 () BitStream!11736)

(declare-fun isPrefixOf!0 (BitStream!11736 BitStream!11736) Bool)

(assert (=> start!57938 (= res!222145 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57938 e!185854))

(declare-fun e!185856 () Bool)

(declare-fun inv!12 (BitStream!11736) Bool)

(assert (=> start!57938 (and (inv!12 w1!584) e!185856)))

(declare-fun e!185851 () Bool)

(assert (=> start!57938 (and (inv!12 w2!580) e!185851)))

(declare-fun b!265871 () Bool)

(declare-fun e!185855 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14818 array!14818 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265871 (= e!185855 (not (arrayBitRangesEq!0 (buf!6929 w1!584) (buf!6929 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584)))))))

(declare-fun b!265872 () Bool)

(declare-fun array_inv!6185 (array!14818) Bool)

(assert (=> b!265872 (= e!185851 (array_inv!6185 (buf!6929 w2!580)))))

(declare-fun b!265873 () Bool)

(declare-fun e!185850 () Bool)

(assert (=> b!265873 (= e!185854 (not e!185850))))

(declare-fun res!222143 () Bool)

(assert (=> b!265873 (=> res!222143 e!185850)))

(assert (=> b!265873 (= res!222143 e!185855)))

(declare-fun res!222141 () Bool)

(assert (=> b!265873 (=> (not res!222141) (not e!185855))))

(assert (=> b!265873 (= res!222141 (not (= (size!6461 (buf!6929 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265873 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18889 0))(
  ( (Unit!18890) )
))
(declare-fun lt!406734 () Unit!18889)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11736) Unit!18889)

(assert (=> b!265873 (= lt!406734 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406733 () BitStream!11736)

(assert (=> b!265873 (isPrefixOf!0 lt!406733 lt!406733)))

(declare-fun lt!406735 () Unit!18889)

(assert (=> b!265873 (= lt!406735 (lemmaIsPrefixRefl!0 lt!406733))))

(assert (=> b!265873 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406736 () Unit!18889)

(assert (=> b!265873 (= lt!406736 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265873 (= lt!406733 (BitStream!11737 (buf!6929 w2!580) (currentByte!12817 w1!584) (currentBit!12812 w1!584)))))

(declare-fun b!265874 () Bool)

(assert (=> b!265874 (= e!185850 (= (size!6461 (buf!6929 w1!584)) (size!6461 (buf!6929 w2!580))))))

(declare-fun b!265875 () Bool)

(assert (=> b!265875 (= e!185856 (array_inv!6185 (buf!6929 w1!584)))))

(declare-fun b!265876 () Bool)

(declare-fun res!222142 () Bool)

(assert (=> b!265876 (=> res!222142 e!185850)))

(assert (=> b!265876 (= res!222142 (= (size!6461 (buf!6929 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265877 () Bool)

(declare-fun res!222144 () Bool)

(assert (=> b!265877 (=> res!222144 e!185850)))

(assert (=> b!265877 (= res!222144 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584))))))

(assert (= (and start!57938 res!222145) b!265873))

(assert (= (and b!265873 res!222141) b!265871))

(assert (= (and b!265873 (not res!222143)) b!265876))

(assert (= (and b!265876 (not res!222142)) b!265877))

(assert (= (and b!265877 (not res!222144)) b!265874))

(assert (= start!57938 b!265875))

(assert (= start!57938 b!265872))

(declare-fun m!396637 () Bool)

(assert (=> start!57938 m!396637))

(declare-fun m!396639 () Bool)

(assert (=> start!57938 m!396639))

(declare-fun m!396641 () Bool)

(assert (=> start!57938 m!396641))

(declare-fun m!396643 () Bool)

(assert (=> b!265873 m!396643))

(declare-fun m!396645 () Bool)

(assert (=> b!265873 m!396645))

(declare-fun m!396647 () Bool)

(assert (=> b!265873 m!396647))

(declare-fun m!396649 () Bool)

(assert (=> b!265873 m!396649))

(declare-fun m!396651 () Bool)

(assert (=> b!265873 m!396651))

(declare-fun m!396653 () Bool)

(assert (=> b!265873 m!396653))

(declare-fun m!396655 () Bool)

(assert (=> b!265877 m!396655))

(declare-fun m!396657 () Bool)

(assert (=> b!265872 m!396657))

(assert (=> b!265871 m!396655))

(assert (=> b!265871 m!396655))

(declare-fun m!396659 () Bool)

(assert (=> b!265871 m!396659))

(declare-fun m!396661 () Bool)

(assert (=> b!265875 m!396661))

(check-sat (not b!265875) (not start!57938) (not b!265873) (not b!265872) (not b!265877) (not b!265871))
(check-sat)
(get-model)

(declare-fun lt!406805 () (_ BitVec 32))

(declare-datatypes ((tuple4!380 0))(
  ( (tuple4!381 (_1!12170 (_ BitVec 32)) (_2!12170 (_ BitVec 32)) (_3!970 (_ BitVec 32)) (_4!190 (_ BitVec 32))) )
))
(declare-fun lt!406807 () tuple4!380)

(declare-fun e!185934 () Bool)

(declare-fun b!265973 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265973 (= e!185934 (byteRangesEq!0 (select (arr!7448 (buf!6929 w1!584)) (_4!190 lt!406807)) (select (arr!7448 (buf!6929 w2!580)) (_4!190 lt!406807)) #b00000000000000000000000000000000 lt!406805))))

(declare-fun b!265974 () Bool)

(declare-fun e!185932 () Bool)

(declare-fun e!185933 () Bool)

(assert (=> b!265974 (= e!185932 e!185933)))

(declare-fun res!222226 () Bool)

(declare-fun call!4154 () Bool)

(assert (=> b!265974 (= res!222226 call!4154)))

(assert (=> b!265974 (=> (not res!222226) (not e!185933))))

(declare-fun b!265975 () Bool)

(assert (=> b!265975 (= e!185932 call!4154)))

(declare-fun d!89794 () Bool)

(declare-fun res!222225 () Bool)

(declare-fun e!185937 () Bool)

(assert (=> d!89794 (=> res!222225 e!185937)))

(assert (=> d!89794 (= res!222225 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584))))))

(assert (=> d!89794 (= (arrayBitRangesEq!0 (buf!6929 w1!584) (buf!6929 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584))) e!185937)))

(declare-fun e!185935 () Bool)

(declare-fun b!265976 () Bool)

(declare-fun arrayRangesEq!1026 (array!14818 array!14818 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265976 (= e!185935 (arrayRangesEq!1026 (buf!6929 w1!584) (buf!6929 w2!580) (_1!12170 lt!406807) (_2!12170 lt!406807)))))

(declare-fun b!265977 () Bool)

(declare-fun e!185936 () Bool)

(assert (=> b!265977 (= e!185936 e!185932)))

(declare-fun c!12231 () Bool)

(assert (=> b!265977 (= c!12231 (= (_3!970 lt!406807) (_4!190 lt!406807)))))

(declare-fun b!265978 () Bool)

(declare-fun res!222229 () Bool)

(assert (=> b!265978 (= res!222229 (= lt!406805 #b00000000000000000000000000000000))))

(assert (=> b!265978 (=> res!222229 e!185934)))

(assert (=> b!265978 (= e!185933 e!185934)))

(declare-fun lt!406806 () (_ BitVec 32))

(declare-fun bm!4151 () Bool)

(assert (=> bm!4151 (= call!4154 (byteRangesEq!0 (select (arr!7448 (buf!6929 w1!584)) (_3!970 lt!406807)) (select (arr!7448 (buf!6929 w2!580)) (_3!970 lt!406807)) lt!406806 (ite c!12231 lt!406805 #b00000000000000000000000000001000)))))

(declare-fun b!265979 () Bool)

(assert (=> b!265979 (= e!185937 e!185936)))

(declare-fun res!222228 () Bool)

(assert (=> b!265979 (=> (not res!222228) (not e!185936))))

(assert (=> b!265979 (= res!222228 e!185935)))

(declare-fun res!222227 () Bool)

(assert (=> b!265979 (=> res!222227 e!185935)))

(assert (=> b!265979 (= res!222227 (bvsge (_1!12170 lt!406807) (_2!12170 lt!406807)))))

(assert (=> b!265979 (= lt!406805 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265979 (= lt!406806 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!380)

(assert (=> b!265979 (= lt!406807 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584))))))

(assert (= (and d!89794 (not res!222225)) b!265979))

(assert (= (and b!265979 (not res!222227)) b!265976))

(assert (= (and b!265979 res!222228) b!265977))

(assert (= (and b!265977 c!12231) b!265975))

(assert (= (and b!265977 (not c!12231)) b!265974))

(assert (= (and b!265974 res!222226) b!265978))

(assert (= (and b!265978 (not res!222229)) b!265973))

(assert (= (or b!265975 b!265974) bm!4151))

(declare-fun m!396733 () Bool)

(assert (=> b!265973 m!396733))

(declare-fun m!396735 () Bool)

(assert (=> b!265973 m!396735))

(assert (=> b!265973 m!396733))

(assert (=> b!265973 m!396735))

(declare-fun m!396737 () Bool)

(assert (=> b!265973 m!396737))

(declare-fun m!396741 () Bool)

(assert (=> b!265976 m!396741))

(declare-fun m!396743 () Bool)

(assert (=> bm!4151 m!396743))

(declare-fun m!396745 () Bool)

(assert (=> bm!4151 m!396745))

(assert (=> bm!4151 m!396743))

(assert (=> bm!4151 m!396745))

(declare-fun m!396747 () Bool)

(assert (=> bm!4151 m!396747))

(assert (=> b!265979 m!396655))

(declare-fun m!396749 () Bool)

(assert (=> b!265979 m!396749))

(assert (=> b!265871 d!89794))

(declare-fun d!89824 () Bool)

(declare-fun e!185964 () Bool)

(assert (=> d!89824 e!185964))

(declare-fun res!222259 () Bool)

(assert (=> d!89824 (=> (not res!222259) (not e!185964))))

(declare-fun lt!406837 () (_ BitVec 64))

(declare-fun lt!406836 () (_ BitVec 64))

(declare-fun lt!406839 () (_ BitVec 64))

(assert (=> d!89824 (= res!222259 (= lt!406836 (bvsub lt!406839 lt!406837)))))

(assert (=> d!89824 (or (= (bvand lt!406839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406839 lt!406837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89824 (= lt!406837 (remainingBits!0 ((_ sign_extend 32) (size!6461 (buf!6929 w1!584))) ((_ sign_extend 32) (currentByte!12817 w1!584)) ((_ sign_extend 32) (currentBit!12812 w1!584))))))

(declare-fun lt!406834 () (_ BitVec 64))

(declare-fun lt!406835 () (_ BitVec 64))

(assert (=> d!89824 (= lt!406839 (bvmul lt!406834 lt!406835))))

(assert (=> d!89824 (or (= lt!406834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406835 (bvsdiv (bvmul lt!406834 lt!406835) lt!406834)))))

(assert (=> d!89824 (= lt!406835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89824 (= lt!406834 ((_ sign_extend 32) (size!6461 (buf!6929 w1!584))))))

(assert (=> d!89824 (= lt!406836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12817 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12812 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89824 (invariant!0 (currentBit!12812 w1!584) (currentByte!12817 w1!584) (size!6461 (buf!6929 w1!584)))))

(assert (=> d!89824 (= (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584)) lt!406836)))

(declare-fun b!266014 () Bool)

(declare-fun res!222258 () Bool)

(assert (=> b!266014 (=> (not res!222258) (not e!185964))))

(assert (=> b!266014 (= res!222258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406836))))

(declare-fun b!266015 () Bool)

(declare-fun lt!406838 () (_ BitVec 64))

(assert (=> b!266015 (= e!185964 (bvsle lt!406836 (bvmul lt!406838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266015 (or (= lt!406838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406838)))))

(assert (=> b!266015 (= lt!406838 ((_ sign_extend 32) (size!6461 (buf!6929 w1!584))))))

(assert (= (and d!89824 res!222259) b!266014))

(assert (= (and b!266014 res!222258) b!266015))

(declare-fun m!396781 () Bool)

(assert (=> d!89824 m!396781))

(declare-fun m!396783 () Bool)

(assert (=> d!89824 m!396783))

(assert (=> b!265871 d!89824))

(declare-fun d!89838 () Bool)

(declare-fun res!222266 () Bool)

(declare-fun e!185969 () Bool)

(assert (=> d!89838 (=> (not res!222266) (not e!185969))))

(assert (=> d!89838 (= res!222266 (= (size!6461 (buf!6929 w1!584)) (size!6461 (buf!6929 w2!580))))))

(assert (=> d!89838 (= (isPrefixOf!0 w1!584 w2!580) e!185969)))

(declare-fun b!266022 () Bool)

(declare-fun res!222267 () Bool)

(assert (=> b!266022 (=> (not res!222267) (not e!185969))))

(assert (=> b!266022 (= res!222267 (bvsle (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584)) (bitIndex!0 (size!6461 (buf!6929 w2!580)) (currentByte!12817 w2!580) (currentBit!12812 w2!580))))))

(declare-fun b!266023 () Bool)

(declare-fun e!185970 () Bool)

(assert (=> b!266023 (= e!185969 e!185970)))

(declare-fun res!222268 () Bool)

(assert (=> b!266023 (=> res!222268 e!185970)))

(assert (=> b!266023 (= res!222268 (= (size!6461 (buf!6929 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266024 () Bool)

(assert (=> b!266024 (= e!185970 (arrayBitRangesEq!0 (buf!6929 w1!584) (buf!6929 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584))))))

(assert (= (and d!89838 res!222266) b!266022))

(assert (= (and b!266022 res!222267) b!266023))

(assert (= (and b!266023 (not res!222268)) b!266024))

(assert (=> b!266022 m!396655))

(declare-fun m!396785 () Bool)

(assert (=> b!266022 m!396785))

(assert (=> b!266024 m!396655))

(assert (=> b!266024 m!396655))

(assert (=> b!266024 m!396659))

(assert (=> start!57938 d!89838))

(declare-fun d!89840 () Bool)

(assert (=> d!89840 (= (inv!12 w1!584) (invariant!0 (currentBit!12812 w1!584) (currentByte!12817 w1!584) (size!6461 (buf!6929 w1!584))))))

(declare-fun bs!22803 () Bool)

(assert (= bs!22803 d!89840))

(assert (=> bs!22803 m!396783))

(assert (=> start!57938 d!89840))

(declare-fun d!89842 () Bool)

(assert (=> d!89842 (= (inv!12 w2!580) (invariant!0 (currentBit!12812 w2!580) (currentByte!12817 w2!580) (size!6461 (buf!6929 w2!580))))))

(declare-fun bs!22804 () Bool)

(assert (= bs!22804 d!89842))

(declare-fun m!396787 () Bool)

(assert (=> bs!22804 m!396787))

(assert (=> start!57938 d!89842))

(declare-fun d!89844 () Bool)

(assert (=> d!89844 (= (array_inv!6185 (buf!6929 w2!580)) (bvsge (size!6461 (buf!6929 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265872 d!89844))

(assert (=> b!265877 d!89824))

(declare-fun d!89846 () Bool)

(assert (=> d!89846 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406842 () Unit!18889)

(declare-fun choose!11 (BitStream!11736) Unit!18889)

(assert (=> d!89846 (= lt!406842 (choose!11 w2!580))))

(assert (=> d!89846 (= (lemmaIsPrefixRefl!0 w2!580) lt!406842)))

(declare-fun bs!22806 () Bool)

(assert (= bs!22806 d!89846))

(assert (=> bs!22806 m!396651))

(declare-fun m!396789 () Bool)

(assert (=> bs!22806 m!396789))

(assert (=> b!265873 d!89846))

(declare-fun d!89848 () Bool)

(declare-fun res!222269 () Bool)

(declare-fun e!185971 () Bool)

(assert (=> d!89848 (=> (not res!222269) (not e!185971))))

(assert (=> d!89848 (= res!222269 (= (size!6461 (buf!6929 lt!406733)) (size!6461 (buf!6929 lt!406733))))))

(assert (=> d!89848 (= (isPrefixOf!0 lt!406733 lt!406733) e!185971)))

(declare-fun b!266025 () Bool)

(declare-fun res!222270 () Bool)

(assert (=> b!266025 (=> (not res!222270) (not e!185971))))

(assert (=> b!266025 (= res!222270 (bvsle (bitIndex!0 (size!6461 (buf!6929 lt!406733)) (currentByte!12817 lt!406733) (currentBit!12812 lt!406733)) (bitIndex!0 (size!6461 (buf!6929 lt!406733)) (currentByte!12817 lt!406733) (currentBit!12812 lt!406733))))))

(declare-fun b!266026 () Bool)

(declare-fun e!185972 () Bool)

(assert (=> b!266026 (= e!185971 e!185972)))

(declare-fun res!222271 () Bool)

(assert (=> b!266026 (=> res!222271 e!185972)))

(assert (=> b!266026 (= res!222271 (= (size!6461 (buf!6929 lt!406733)) #b00000000000000000000000000000000))))

(declare-fun b!266027 () Bool)

(assert (=> b!266027 (= e!185972 (arrayBitRangesEq!0 (buf!6929 lt!406733) (buf!6929 lt!406733) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6461 (buf!6929 lt!406733)) (currentByte!12817 lt!406733) (currentBit!12812 lt!406733))))))

(assert (= (and d!89848 res!222269) b!266025))

(assert (= (and b!266025 res!222270) b!266026))

(assert (= (and b!266026 (not res!222271)) b!266027))

(declare-fun m!396791 () Bool)

(assert (=> b!266025 m!396791))

(assert (=> b!266025 m!396791))

(assert (=> b!266027 m!396791))

(assert (=> b!266027 m!396791))

(declare-fun m!396793 () Bool)

(assert (=> b!266027 m!396793))

(assert (=> b!265873 d!89848))

(declare-fun d!89850 () Bool)

(assert (=> d!89850 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406843 () Unit!18889)

(assert (=> d!89850 (= lt!406843 (choose!11 w1!584))))

(assert (=> d!89850 (= (lemmaIsPrefixRefl!0 w1!584) lt!406843)))

(declare-fun bs!22807 () Bool)

(assert (= bs!22807 d!89850))

(assert (=> bs!22807 m!396649))

(declare-fun m!396795 () Bool)

(assert (=> bs!22807 m!396795))

(assert (=> b!265873 d!89850))

(declare-fun d!89852 () Bool)

(assert (=> d!89852 (isPrefixOf!0 lt!406733 lt!406733)))

(declare-fun lt!406844 () Unit!18889)

(assert (=> d!89852 (= lt!406844 (choose!11 lt!406733))))

(assert (=> d!89852 (= (lemmaIsPrefixRefl!0 lt!406733) lt!406844)))

(declare-fun bs!22808 () Bool)

(assert (= bs!22808 d!89852))

(assert (=> bs!22808 m!396647))

(declare-fun m!396797 () Bool)

(assert (=> bs!22808 m!396797))

(assert (=> b!265873 d!89852))

(declare-fun d!89854 () Bool)

(declare-fun res!222272 () Bool)

(declare-fun e!185973 () Bool)

(assert (=> d!89854 (=> (not res!222272) (not e!185973))))

(assert (=> d!89854 (= res!222272 (= (size!6461 (buf!6929 w1!584)) (size!6461 (buf!6929 w1!584))))))

(assert (=> d!89854 (= (isPrefixOf!0 w1!584 w1!584) e!185973)))

(declare-fun b!266028 () Bool)

(declare-fun res!222273 () Bool)

(assert (=> b!266028 (=> (not res!222273) (not e!185973))))

(assert (=> b!266028 (= res!222273 (bvsle (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584)) (bitIndex!0 (size!6461 (buf!6929 w1!584)) (currentByte!12817 w1!584) (currentBit!12812 w1!584))))))

(declare-fun b!266029 () Bool)

(declare-fun e!185974 () Bool)

