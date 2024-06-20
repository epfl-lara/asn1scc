; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57936 () Bool)

(assert start!57936)

(declare-fun b!265850 () Bool)

(declare-fun res!222128 () Bool)

(declare-fun e!185832 () Bool)

(assert (=> b!265850 (=> res!222128 e!185832)))

(declare-datatypes ((array!14816 0))(
  ( (array!14817 (arr!7447 (Array (_ BitVec 32) (_ BitVec 8))) (size!6460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11734 0))(
  ( (BitStream!11735 (buf!6928 array!14816) (currentByte!12816 (_ BitVec 32)) (currentBit!12811 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11734)

(assert (=> b!265850 (= res!222128 (= (size!6460 (buf!6928 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265851 () Bool)

(declare-fun e!185834 () Bool)

(assert (=> b!265851 (= e!185834 (not e!185832))))

(declare-fun res!222129 () Bool)

(assert (=> b!265851 (=> res!222129 e!185832)))

(declare-fun e!185831 () Bool)

(assert (=> b!265851 (= res!222129 e!185831)))

(declare-fun res!222126 () Bool)

(assert (=> b!265851 (=> (not res!222126) (not e!185831))))

(assert (=> b!265851 (= res!222126 (not (= (size!6460 (buf!6928 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11734)

(declare-fun isPrefixOf!0 (BitStream!11734 BitStream!11734) Bool)

(assert (=> b!265851 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18887 0))(
  ( (Unit!18888) )
))
(declare-fun lt!406722 () Unit!18887)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11734) Unit!18887)

(assert (=> b!265851 (= lt!406722 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406724 () BitStream!11734)

(assert (=> b!265851 (isPrefixOf!0 lt!406724 lt!406724)))

(declare-fun lt!406723 () Unit!18887)

(assert (=> b!265851 (= lt!406723 (lemmaIsPrefixRefl!0 lt!406724))))

(assert (=> b!265851 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406721 () Unit!18887)

(assert (=> b!265851 (= lt!406721 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265851 (= lt!406724 (BitStream!11735 (buf!6928 w2!580) (currentByte!12816 w1!584) (currentBit!12811 w1!584)))))

(declare-fun b!265852 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14816 array!14816 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265852 (= e!185831 (not (arrayBitRangesEq!0 (buf!6928 w1!584) (buf!6928 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584)))))))

(declare-fun res!222127 () Bool)

(assert (=> start!57936 (=> (not res!222127) (not e!185834))))

(assert (=> start!57936 (= res!222127 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57936 e!185834))

(declare-fun e!185829 () Bool)

(declare-fun inv!12 (BitStream!11734) Bool)

(assert (=> start!57936 (and (inv!12 w1!584) e!185829)))

(declare-fun e!185833 () Bool)

(assert (=> start!57936 (and (inv!12 w2!580) e!185833)))

(declare-fun b!265853 () Bool)

(declare-fun array_inv!6184 (array!14816) Bool)

(assert (=> b!265853 (= e!185829 (array_inv!6184 (buf!6928 w1!584)))))

(declare-fun b!265854 () Bool)

(declare-fun res!222130 () Bool)

(assert (=> b!265854 (=> res!222130 e!185832)))

(assert (=> b!265854 (= res!222130 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))))))

(declare-fun b!265855 () Bool)

(assert (=> b!265855 (= e!185833 (array_inv!6184 (buf!6928 w2!580)))))

(declare-fun b!265856 () Bool)

(assert (=> b!265856 (= e!185832 (= (size!6460 (buf!6928 w1!584)) (size!6460 (buf!6928 w2!580))))))

(assert (= (and start!57936 res!222127) b!265851))

(assert (= (and b!265851 res!222126) b!265852))

(assert (= (and b!265851 (not res!222129)) b!265850))

(assert (= (and b!265850 (not res!222128)) b!265854))

(assert (= (and b!265854 (not res!222130)) b!265856))

(assert (= start!57936 b!265853))

(assert (= start!57936 b!265855))

(declare-fun m!396611 () Bool)

(assert (=> start!57936 m!396611))

(declare-fun m!396613 () Bool)

(assert (=> start!57936 m!396613))

(declare-fun m!396615 () Bool)

(assert (=> start!57936 m!396615))

(declare-fun m!396617 () Bool)

(assert (=> b!265852 m!396617))

(assert (=> b!265852 m!396617))

(declare-fun m!396619 () Bool)

(assert (=> b!265852 m!396619))

(assert (=> b!265854 m!396617))

(declare-fun m!396621 () Bool)

(assert (=> b!265853 m!396621))

(declare-fun m!396623 () Bool)

(assert (=> b!265851 m!396623))

(declare-fun m!396625 () Bool)

(assert (=> b!265851 m!396625))

(declare-fun m!396627 () Bool)

(assert (=> b!265851 m!396627))

(declare-fun m!396629 () Bool)

(assert (=> b!265851 m!396629))

(declare-fun m!396631 () Bool)

(assert (=> b!265851 m!396631))

(declare-fun m!396633 () Bool)

(assert (=> b!265851 m!396633))

(declare-fun m!396635 () Bool)

(assert (=> b!265855 m!396635))

(push 1)

(assert (not b!265852))

(assert (not b!265854))

(assert (not b!265853))

(assert (not b!265855))

(assert (not b!265851))

(assert (not start!57936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!4151 () Bool)

(declare-datatypes ((tuple4!378 0))(
  ( (tuple4!379 (_1!12169 (_ BitVec 32)) (_2!12169 (_ BitVec 32)) (_3!969 (_ BitVec 32)) (_4!189 (_ BitVec 32))) )
))
(declare-fun lt!406760 () tuple4!378)

(declare-fun lt!406761 () (_ BitVec 32))

(declare-fun lt!406762 () (_ BitVec 32))

(declare-fun bm!4148 () Bool)

(declare-fun c!12228 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4148 (= call!4151 (byteRangesEq!0 (select (arr!7447 (buf!6928 w1!584)) (_3!969 lt!406760)) (select (arr!7447 (buf!6928 w2!580)) (_3!969 lt!406760)) lt!406761 (ite c!12228 lt!406762 #b00000000000000000000000000001000)))))

(declare-fun b!265928 () Bool)

(declare-fun e!185902 () Bool)

(assert (=> b!265928 (= e!185902 call!4151)))

(declare-fun e!185903 () Bool)

(declare-fun b!265929 () Bool)

(assert (=> b!265929 (= e!185903 (byteRangesEq!0 (select (arr!7447 (buf!6928 w1!584)) (_4!189 lt!406760)) (select (arr!7447 (buf!6928 w2!580)) (_4!189 lt!406760)) #b00000000000000000000000000000000 lt!406762))))

(declare-fun e!185905 () Bool)

(declare-fun b!265930 () Bool)

(declare-fun arrayRangesEq!1025 (array!14816 array!14816 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265930 (= e!185905 (arrayRangesEq!1025 (buf!6928 w1!584) (buf!6928 w2!580) (_1!12169 lt!406760) (_2!12169 lt!406760)))))

(declare-fun d!89782 () Bool)

(declare-fun res!222188 () Bool)

(declare-fun e!185900 () Bool)

(assert (=> d!89782 (=> res!222188 e!185900)))

(assert (=> d!89782 (= res!222188 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))))))

(assert (=> d!89782 (= (arrayBitRangesEq!0 (buf!6928 w1!584) (buf!6928 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))) e!185900)))

(declare-fun b!265931 () Bool)

(declare-fun e!185904 () Bool)

(assert (=> b!265931 (= e!185900 e!185904)))

(declare-fun res!222186 () Bool)

(assert (=> b!265931 (=> (not res!222186) (not e!185904))))

(assert (=> b!265931 (= res!222186 e!185905)))

(declare-fun res!222187 () Bool)

(assert (=> b!265931 (=> res!222187 e!185905)))

(assert (=> b!265931 (= res!222187 (bvsge (_1!12169 lt!406760) (_2!12169 lt!406760)))))

(assert (=> b!265931 (= lt!406762 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265931 (= lt!406761 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!378)

(assert (=> b!265931 (= lt!406760 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))))))

(declare-fun b!265932 () Bool)

(declare-fun e!185901 () Bool)

(assert (=> b!265932 (= e!185902 e!185901)))

(declare-fun res!222189 () Bool)

(assert (=> b!265932 (= res!222189 call!4151)))

(assert (=> b!265932 (=> (not res!222189) (not e!185901))))

(declare-fun b!265933 () Bool)

(declare-fun res!222190 () Bool)

(assert (=> b!265933 (= res!222190 (= lt!406762 #b00000000000000000000000000000000))))

(assert (=> b!265933 (=> res!222190 e!185903)))

(assert (=> b!265933 (= e!185901 e!185903)))

(declare-fun b!265934 () Bool)

(assert (=> b!265934 (= e!185904 e!185902)))

(assert (=> b!265934 (= c!12228 (= (_3!969 lt!406760) (_4!189 lt!406760)))))

(assert (= (and d!89782 (not res!222188)) b!265931))

(assert (= (and b!265931 (not res!222187)) b!265930))

(assert (= (and b!265931 res!222186) b!265934))

(assert (= (and b!265934 c!12228) b!265928))

(assert (= (and b!265934 (not c!12228)) b!265932))

(assert (= (and b!265932 res!222189) b!265933))

(assert (= (and b!265933 (not res!222190)) b!265929))

(assert (= (or b!265928 b!265932) bm!4148))

(declare-fun m!396705 () Bool)

(assert (=> bm!4148 m!396705))

(declare-fun m!396707 () Bool)

(assert (=> bm!4148 m!396707))

(assert (=> bm!4148 m!396705))

(assert (=> bm!4148 m!396707))

(declare-fun m!396709 () Bool)

(assert (=> bm!4148 m!396709))

(declare-fun m!396711 () Bool)

(assert (=> b!265929 m!396711))

(declare-fun m!396713 () Bool)

(assert (=> b!265929 m!396713))

(assert (=> b!265929 m!396711))

(assert (=> b!265929 m!396713))

(declare-fun m!396715 () Bool)

(assert (=> b!265929 m!396715))

(declare-fun m!396717 () Bool)

(assert (=> b!265930 m!396717))

(assert (=> b!265931 m!396617))

(declare-fun m!396719 () Bool)

(assert (=> b!265931 m!396719))

(assert (=> b!265852 d!89782))

(declare-fun d!89802 () Bool)

(declare-fun e!185913 () Bool)

(assert (=> d!89802 e!185913))

(declare-fun res!222204 () Bool)

(assert (=> d!89802 (=> (not res!222204) (not e!185913))))

(declare-fun lt!406794 () (_ BitVec 64))

(declare-fun lt!406798 () (_ BitVec 64))

(declare-fun lt!406797 () (_ BitVec 64))

(assert (=> d!89802 (= res!222204 (= lt!406797 (bvsub lt!406798 lt!406794)))))

(assert (=> d!89802 (or (= (bvand lt!406798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406798 lt!406794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89802 (= lt!406794 (remainingBits!0 ((_ sign_extend 32) (size!6460 (buf!6928 w1!584))) ((_ sign_extend 32) (currentByte!12816 w1!584)) ((_ sign_extend 32) (currentBit!12811 w1!584))))))

(declare-fun lt!406793 () (_ BitVec 64))

(declare-fun lt!406796 () (_ BitVec 64))

(assert (=> d!89802 (= lt!406798 (bvmul lt!406793 lt!406796))))

(assert (=> d!89802 (or (= lt!406793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406796 (bvsdiv (bvmul lt!406793 lt!406796) lt!406793)))))

(assert (=> d!89802 (= lt!406796 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89802 (= lt!406793 ((_ sign_extend 32) (size!6460 (buf!6928 w1!584))))))

(assert (=> d!89802 (= lt!406797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12816 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12811 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89802 (invariant!0 (currentBit!12811 w1!584) (currentByte!12816 w1!584) (size!6460 (buf!6928 w1!584)))))

(assert (=> d!89802 (= (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584)) lt!406797)))

(declare-fun b!265948 () Bool)

(declare-fun res!222205 () Bool)

(assert (=> b!265948 (=> (not res!222205) (not e!185913))))

(assert (=> b!265948 (= res!222205 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406797))))

(declare-fun b!265949 () Bool)

(declare-fun lt!406795 () (_ BitVec 64))

(assert (=> b!265949 (= e!185913 (bvsle lt!406797 (bvmul lt!406795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265949 (or (= lt!406795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406795)))))

(assert (=> b!265949 (= lt!406795 ((_ sign_extend 32) (size!6460 (buf!6928 w1!584))))))

(assert (= (and d!89802 res!222204) b!265948))

(assert (= (and b!265948 res!222205) b!265949))

(declare-fun m!396727 () Bool)

(assert (=> d!89802 m!396727))

(declare-fun m!396729 () Bool)

(assert (=> d!89802 m!396729))

(assert (=> b!265852 d!89802))

(declare-fun d!89812 () Bool)

(assert (=> d!89812 (= (array_inv!6184 (buf!6928 w1!584)) (bvsge (size!6460 (buf!6928 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265853 d!89812))

(assert (=> b!265854 d!89802))

(declare-fun d!89814 () Bool)

(assert (=> d!89814 (= (array_inv!6184 (buf!6928 w2!580)) (bvsge (size!6460 (buf!6928 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265855 d!89814))

(declare-fun d!89816 () Bool)

(declare-fun res!222222 () Bool)

(declare-fun e!185931 () Bool)

(assert (=> d!89816 (=> (not res!222222) (not e!185931))))

(assert (=> d!89816 (= res!222222 (= (size!6460 (buf!6928 w1!584)) (size!6460 (buf!6928 w2!580))))))

(assert (=> d!89816 (= (isPrefixOf!0 w1!584 w2!580) e!185931)))

(declare-fun b!265970 () Bool)

(declare-fun res!222223 () Bool)

(assert (=> b!265970 (=> (not res!222223) (not e!185931))))

(assert (=> b!265970 (= res!222223 (bvsle (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584)) (bitIndex!0 (size!6460 (buf!6928 w2!580)) (currentByte!12816 w2!580) (currentBit!12811 w2!580))))))

(declare-fun b!265971 () Bool)

(declare-fun e!185930 () Bool)

(assert (=> b!265971 (= e!185931 e!185930)))

(declare-fun res!222224 () Bool)

(assert (=> b!265971 (=> res!222224 e!185930)))

(assert (=> b!265971 (= res!222224 (= (size!6460 (buf!6928 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265972 () Bool)

(assert (=> b!265972 (= e!185930 (arrayBitRangesEq!0 (buf!6928 w1!584) (buf!6928 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))))))

(assert (= (and d!89816 res!222222) b!265970))

(assert (= (and b!265970 res!222223) b!265971))

(assert (= (and b!265971 (not res!222224)) b!265972))

(assert (=> b!265970 m!396617))

(declare-fun m!396731 () Bool)

(assert (=> b!265970 m!396731))

(assert (=> b!265972 m!396617))

(assert (=> b!265972 m!396617))

(assert (=> b!265972 m!396619))

(assert (=> start!57936 d!89816))

(declare-fun d!89818 () Bool)

(assert (=> d!89818 (= (inv!12 w1!584) (invariant!0 (currentBit!12811 w1!584) (currentByte!12816 w1!584) (size!6460 (buf!6928 w1!584))))))

(declare-fun bs!22797 () Bool)

(assert (= bs!22797 d!89818))

(assert (=> bs!22797 m!396729))

(assert (=> start!57936 d!89818))

(declare-fun d!89820 () Bool)

(assert (=> d!89820 (= (inv!12 w2!580) (invariant!0 (currentBit!12811 w2!580) (currentByte!12816 w2!580) (size!6460 (buf!6928 w2!580))))))

(declare-fun bs!22798 () Bool)

(assert (= bs!22798 d!89820))

(declare-fun m!396739 () Bool)

(assert (=> bs!22798 m!396739))

(assert (=> start!57936 d!89820))

(declare-fun d!89822 () Bool)

(assert (=> d!89822 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406816 () Unit!18887)

(declare-fun choose!11 (BitStream!11734) Unit!18887)

(assert (=> d!89822 (= lt!406816 (choose!11 w2!580))))

(assert (=> d!89822 (= (lemmaIsPrefixRefl!0 w2!580) lt!406816)))

(declare-fun bs!22800 () Bool)

(assert (= bs!22800 d!89822))

(assert (=> bs!22800 m!396629))

(declare-fun m!396751 () Bool)

(assert (=> bs!22800 m!396751))

(assert (=> b!265851 d!89822))

(declare-fun d!89826 () Bool)

(assert (=> d!89826 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406817 () Unit!18887)

(assert (=> d!89826 (= lt!406817 (choose!11 w1!584))))

(assert (=> d!89826 (= (lemmaIsPrefixRefl!0 w1!584) lt!406817)))

(declare-fun bs!22801 () Bool)

(assert (= bs!22801 d!89826))

(assert (=> bs!22801 m!396627))

(declare-fun m!396753 () Bool)

(assert (=> bs!22801 m!396753))

(assert (=> b!265851 d!89826))

(declare-fun d!89828 () Bool)

(declare-fun res!222240 () Bool)

(declare-fun e!185951 () Bool)

(assert (=> d!89828 (=> (not res!222240) (not e!185951))))

(assert (=> d!89828 (= res!222240 (= (size!6460 (buf!6928 lt!406724)) (size!6460 (buf!6928 lt!406724))))))

(assert (=> d!89828 (= (isPrefixOf!0 lt!406724 lt!406724) e!185951)))

(declare-fun b!265994 () Bool)

(declare-fun res!222241 () Bool)

(assert (=> b!265994 (=> (not res!222241) (not e!185951))))

(assert (=> b!265994 (= res!222241 (bvsle (bitIndex!0 (size!6460 (buf!6928 lt!406724)) (currentByte!12816 lt!406724) (currentBit!12811 lt!406724)) (bitIndex!0 (size!6460 (buf!6928 lt!406724)) (currentByte!12816 lt!406724) (currentBit!12811 lt!406724))))))

(declare-fun b!265995 () Bool)

(declare-fun e!185950 () Bool)

(assert (=> b!265995 (= e!185951 e!185950)))

(declare-fun res!222242 () Bool)

(assert (=> b!265995 (=> res!222242 e!185950)))

(assert (=> b!265995 (= res!222242 (= (size!6460 (buf!6928 lt!406724)) #b00000000000000000000000000000000))))

(declare-fun b!265996 () Bool)

(assert (=> b!265996 (= e!185950 (arrayBitRangesEq!0 (buf!6928 lt!406724) (buf!6928 lt!406724) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 lt!406724)) (currentByte!12816 lt!406724) (currentBit!12811 lt!406724))))))

(assert (= (and d!89828 res!222240) b!265994))

(assert (= (and b!265994 res!222241) b!265995))

(assert (= (and b!265995 (not res!222242)) b!265996))

(declare-fun m!396755 () Bool)

(assert (=> b!265994 m!396755))

(assert (=> b!265994 m!396755))

(assert (=> b!265996 m!396755))

(assert (=> b!265996 m!396755))

(declare-fun m!396757 () Bool)

(assert (=> b!265996 m!396757))

(assert (=> b!265851 d!89828))

(declare-fun d!89830 () Bool)

(assert (=> d!89830 (isPrefixOf!0 lt!406724 lt!406724)))

(declare-fun lt!406818 () Unit!18887)

(assert (=> d!89830 (= lt!406818 (choose!11 lt!406724))))

(assert (=> d!89830 (= (lemmaIsPrefixRefl!0 lt!406724) lt!406818)))

(declare-fun bs!22802 () Bool)

(assert (= bs!22802 d!89830))

(assert (=> bs!22802 m!396625))

(declare-fun m!396759 () Bool)

(assert (=> bs!22802 m!396759))

(assert (=> b!265851 d!89830))

(declare-fun d!89832 () Bool)

(declare-fun res!222243 () Bool)

(declare-fun e!185953 () Bool)

(assert (=> d!89832 (=> (not res!222243) (not e!185953))))

(assert (=> d!89832 (= res!222243 (= (size!6460 (buf!6928 w1!584)) (size!6460 (buf!6928 w1!584))))))

(assert (=> d!89832 (= (isPrefixOf!0 w1!584 w1!584) e!185953)))

(declare-fun b!265997 () Bool)

(declare-fun res!222244 () Bool)

(assert (=> b!265997 (=> (not res!222244) (not e!185953))))

(assert (=> b!265997 (= res!222244 (bvsle (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584)) (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))))))

(declare-fun b!265998 () Bool)

(declare-fun e!185952 () Bool)

(assert (=> b!265998 (= e!185953 e!185952)))

(declare-fun res!222245 () Bool)

(assert (=> b!265998 (=> res!222245 e!185952)))

(assert (=> b!265998 (= res!222245 (= (size!6460 (buf!6928 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265999 () Bool)

(assert (=> b!265999 (= e!185952 (arrayBitRangesEq!0 (buf!6928 w1!584) (buf!6928 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w1!584)) (currentByte!12816 w1!584) (currentBit!12811 w1!584))))))

(assert (= (and d!89832 res!222243) b!265997))

(assert (= (and b!265997 res!222244) b!265998))

(assert (= (and b!265998 (not res!222245)) b!265999))

(assert (=> b!265997 m!396617))

(assert (=> b!265997 m!396617))

(assert (=> b!265999 m!396617))

(assert (=> b!265999 m!396617))

(declare-fun m!396761 () Bool)

(assert (=> b!265999 m!396761))

(assert (=> b!265851 d!89832))

(declare-fun d!89834 () Bool)

(declare-fun res!222251 () Bool)

(declare-fun e!185961 () Bool)

(assert (=> d!89834 (=> (not res!222251) (not e!185961))))

(assert (=> d!89834 (= res!222251 (= (size!6460 (buf!6928 w2!580)) (size!6460 (buf!6928 w2!580))))))

(assert (=> d!89834 (= (isPrefixOf!0 w2!580 w2!580) e!185961)))

(declare-fun b!266007 () Bool)

(declare-fun res!222252 () Bool)

(assert (=> b!266007 (=> (not res!222252) (not e!185961))))

(assert (=> b!266007 (= res!222252 (bvsle (bitIndex!0 (size!6460 (buf!6928 w2!580)) (currentByte!12816 w2!580) (currentBit!12811 w2!580)) (bitIndex!0 (size!6460 (buf!6928 w2!580)) (currentByte!12816 w2!580) (currentBit!12811 w2!580))))))

(declare-fun b!266008 () Bool)

(declare-fun e!185960 () Bool)

(assert (=> b!266008 (= e!185961 e!185960)))

(declare-fun res!222253 () Bool)

(assert (=> b!266008 (=> res!222253 e!185960)))

(assert (=> b!266008 (= res!222253 (= (size!6460 (buf!6928 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266009 () Bool)

(assert (=> b!266009 (= e!185960 (arrayBitRangesEq!0 (buf!6928 w2!580) (buf!6928 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6460 (buf!6928 w2!580)) (currentByte!12816 w2!580) (currentBit!12811 w2!580))))))

(assert (= (and d!89834 res!222251) b!266007))

(assert (= (and b!266007 res!222252) b!266008))

(assert (= (and b!266008 (not res!222253)) b!266009))

(assert (=> b!266007 m!396731))

(assert (=> b!266007 m!396731))

(assert (=> b!266009 m!396731))

(assert (=> b!266009 m!396731))

(declare-fun m!396763 () Bool)

(assert (=> b!266009 m!396763))

(assert (=> b!265851 d!89834))

(push 1)

(assert (not d!89818))

(assert (not d!89830))

(assert (not d!89802))

(assert (not b!265994))

(assert (not d!89826))

(assert (not bm!4148))

(assert (not d!89822))

(assert (not b!265999))

(assert (not b!265929))

(assert (not b!266009))

(assert (not b!265930))

(assert (not b!265972))

(assert (not b!265931))

(assert (not b!265996))

(assert (not b!265970))

(assert (not b!266007))

(assert (not b!265997))

(assert (not d!89820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

