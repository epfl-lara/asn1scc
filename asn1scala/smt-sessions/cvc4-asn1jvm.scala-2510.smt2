; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63452 () Bool)

(assert start!63452)

(declare-fun res!235124 () Bool)

(declare-fun e!202668 () Bool)

(assert (=> start!63452 (=> (not res!235124) (not e!202668))))

(declare-datatypes ((array!16514 0))(
  ( (array!16515 (arr!8127 (Array (_ BitVec 32) (_ BitVec 8))) (size!7131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12632 0))(
  ( (BitStream!12633 (buf!7377 array!16514) (currentByte!13666 (_ BitVec 32)) (currentBit!13661 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12632)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63452 (= res!235124 (validate_offset_bits!1 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13666 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13661 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63452 e!202668))

(declare-fun e!202667 () Bool)

(declare-fun inv!12 (BitStream!12632) Bool)

(assert (=> start!63452 (and (inv!12 thiss!1939) e!202667)))

(declare-fun b!283733 () Bool)

(declare-datatypes ((Unit!19875 0))(
  ( (Unit!19876) )
))
(declare-datatypes ((tuple2!22606 0))(
  ( (tuple2!22607 (_1!12497 Unit!19875) (_2!12497 BitStream!12632)) )
))
(declare-fun lt!418101 () tuple2!22606)

(assert (=> b!283733 (= e!202668 (and (= (bvand (currentByte!13666 (_2!12497 lt!418101)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!13666 (_2!12497 lt!418101)) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!13666 (_2!12497 lt!418101))) #b10000000000000000000000000000000)))))))

(declare-fun alignToByte!0 (BitStream!12632) tuple2!22606)

(assert (=> b!283733 (= lt!418101 (alignToByte!0 thiss!1939))))

(declare-fun b!283734 () Bool)

(declare-fun array_inv!6824 (array!16514) Bool)

(assert (=> b!283734 (= e!202667 (array_inv!6824 (buf!7377 thiss!1939)))))

(assert (= (and start!63452 res!235124) b!283733))

(assert (= start!63452 b!283734))

(declare-fun m!416825 () Bool)

(assert (=> start!63452 m!416825))

(declare-fun m!416827 () Bool)

(assert (=> start!63452 m!416827))

(declare-fun m!416829 () Bool)

(assert (=> b!283733 m!416829))

(declare-fun m!416831 () Bool)

(assert (=> b!283734 m!416831))

(push 1)

(assert (not start!63452))

(assert (not b!283733))

(assert (not b!283734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97450 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13666 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13661 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13666 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13661 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24605 () Bool)

(assert (= bs!24605 d!97450))

(declare-fun m!416837 () Bool)

(assert (=> bs!24605 m!416837))

(assert (=> start!63452 d!97450))

(declare-fun d!97452 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97452 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13661 thiss!1939) (currentByte!13666 thiss!1939) (size!7131 (buf!7377 thiss!1939))))))

(declare-fun bs!24606 () Bool)

(assert (= bs!24606 d!97452))

(declare-fun m!416839 () Bool)

(assert (=> bs!24606 m!416839))

(assert (=> start!63452 d!97452))

(declare-fun d!97454 () Bool)

(declare-fun e!202685 () Bool)

(assert (=> d!97454 e!202685))

(declare-fun res!235141 () Bool)

(assert (=> d!97454 (=> (not res!235141) (not e!202685))))

(assert (=> d!97454 (= res!235141 (validate_offset_bits!1 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13661 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun Unit!19885 () Unit!19875)

(declare-fun Unit!19886 () Unit!19875)

(assert (=> d!97454 (= (alignToByte!0 thiss!1939) (ite (not (= (currentBit!13661 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22607 Unit!19885 (BitStream!12633 (buf!7377 thiss!1939) (bvadd (currentByte!13666 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22607 Unit!19886 thiss!1939)))))

(declare-fun b!283751 () Bool)

(declare-fun e!202686 () Bool)

(assert (=> b!283751 (= e!202685 e!202686)))

(declare-fun res!235142 () Bool)

(assert (=> b!283751 (=> (not res!235142) (not e!202686))))

(declare-fun lt!418126 () tuple2!22606)

(assert (=> b!283751 (= res!235142 (= (buf!7377 (_2!12497 lt!418126)) (buf!7377 thiss!1939)))))

(declare-fun Unit!19887 () Unit!19875)

(declare-fun Unit!19888 () Unit!19875)

(assert (=> b!283751 (= lt!418126 (ite (not (= (currentBit!13661 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22607 Unit!19887 (BitStream!12633 (buf!7377 thiss!1939) (bvadd (currentByte!13666 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22607 Unit!19888 thiss!1939)))))

(declare-fun b!283752 () Bool)

(declare-fun lt!418128 () (_ BitVec 64))

(declare-fun lt!418127 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!283752 (= e!202686 (bvsle (bitIndex!0 (size!7131 (buf!7377 (_2!12497 lt!418126))) (currentByte!13666 (_2!12497 lt!418126)) (currentBit!13661 (_2!12497 lt!418126))) (bvadd lt!418128 lt!418127)))))

(assert (=> b!283752 (or (not (= (bvand lt!418128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418127 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!418128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!418128 lt!418127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!283752 (= lt!418127 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!283752 (= lt!418128 (bitIndex!0 (size!7131 (buf!7377 thiss!1939)) (currentByte!13666 thiss!1939) (currentBit!13661 thiss!1939)))))

(assert (= (and d!97454 res!235141) b!283751))

(assert (= (and b!283751 res!235142) b!283752))

(declare-fun m!416857 () Bool)

(assert (=> d!97454 m!416857))

(declare-fun m!416859 () Bool)

(assert (=> b!283752 m!416859))

(declare-fun m!416861 () Bool)

(assert (=> b!283752 m!416861))

(assert (=> b!283733 d!97454))

(declare-fun d!97462 () Bool)

(assert (=> d!97462 (= (array_inv!6824 (buf!7377 thiss!1939)) (bvsge (size!7131 (buf!7377 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283734 d!97462))

(push 1)

(assert (not b!283752))

(assert (not d!97454))

(assert (not d!97450))

(assert (not d!97452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97484 () Bool)

(declare-fun e!202697 () Bool)

(assert (=> d!97484 e!202697))

(declare-fun res!235163 () Bool)

(assert (=> d!97484 (=> (not res!235163) (not e!202697))))

(declare-fun lt!418194 () (_ BitVec 64))

(declare-fun lt!418192 () (_ BitVec 64))

(declare-fun lt!418190 () (_ BitVec 64))

(assert (=> d!97484 (= res!235163 (= lt!418190 (bvsub lt!418194 lt!418192)))))

(assert (=> d!97484 (or (= (bvand lt!418194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418194 lt!418192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97484 (= lt!418192 (remainingBits!0 ((_ sign_extend 32) (size!7131 (buf!7377 (_2!12497 lt!418126)))) ((_ sign_extend 32) (currentByte!13666 (_2!12497 lt!418126))) ((_ sign_extend 32) (currentBit!13661 (_2!12497 lt!418126)))))))

(declare-fun lt!418193 () (_ BitVec 64))

(declare-fun lt!418189 () (_ BitVec 64))

(assert (=> d!97484 (= lt!418194 (bvmul lt!418193 lt!418189))))

(assert (=> d!97484 (or (= lt!418193 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418189 (bvsdiv (bvmul lt!418193 lt!418189) lt!418193)))))

(assert (=> d!97484 (= lt!418189 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97484 (= lt!418193 ((_ sign_extend 32) (size!7131 (buf!7377 (_2!12497 lt!418126)))))))

(assert (=> d!97484 (= lt!418190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13666 (_2!12497 lt!418126))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13661 (_2!12497 lt!418126)))))))

(assert (=> d!97484 (invariant!0 (currentBit!13661 (_2!12497 lt!418126)) (currentByte!13666 (_2!12497 lt!418126)) (size!7131 (buf!7377 (_2!12497 lt!418126))))))

(assert (=> d!97484 (= (bitIndex!0 (size!7131 (buf!7377 (_2!12497 lt!418126))) (currentByte!13666 (_2!12497 lt!418126)) (currentBit!13661 (_2!12497 lt!418126))) lt!418190)))

(declare-fun b!283773 () Bool)

(declare-fun res!235164 () Bool)

(assert (=> b!283773 (=> (not res!235164) (not e!202697))))

(assert (=> b!283773 (= res!235164 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418190))))

(declare-fun b!283774 () Bool)

(declare-fun lt!418191 () (_ BitVec 64))

(assert (=> b!283774 (= e!202697 (bvsle lt!418190 (bvmul lt!418191 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283774 (or (= lt!418191 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418191 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418191)))))

(assert (=> b!283774 (= lt!418191 ((_ sign_extend 32) (size!7131 (buf!7377 (_2!12497 lt!418126)))))))

(assert (= (and d!97484 res!235163) b!283773))

(assert (= (and b!283773 res!235164) b!283774))

(declare-fun m!416871 () Bool)

(assert (=> d!97484 m!416871))

(declare-fun m!416873 () Bool)

(assert (=> d!97484 m!416873))

(assert (=> b!283752 d!97484))

(declare-fun d!97486 () Bool)

(declare-fun e!202698 () Bool)

(assert (=> d!97486 e!202698))

(declare-fun res!235165 () Bool)

(assert (=> d!97486 (=> (not res!235165) (not e!202698))))

(declare-fun lt!418200 () (_ BitVec 64))

(declare-fun lt!418196 () (_ BitVec 64))

(declare-fun lt!418198 () (_ BitVec 64))

(assert (=> d!97486 (= res!235165 (= lt!418196 (bvsub lt!418200 lt!418198)))))

(assert (=> d!97486 (or (= (bvand lt!418200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418200 lt!418198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97486 (= lt!418198 (remainingBits!0 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939))))))

(declare-fun lt!418199 () (_ BitVec 64))

(declare-fun lt!418195 () (_ BitVec 64))

(assert (=> d!97486 (= lt!418200 (bvmul lt!418199 lt!418195))))

(assert (=> d!97486 (or (= lt!418199 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418195 (bvsdiv (bvmul lt!418199 lt!418195) lt!418199)))))

(assert (=> d!97486 (= lt!418195 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97486 (= lt!418199 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))))))

(assert (=> d!97486 (= lt!418196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13666 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13661 thiss!1939))))))

(assert (=> d!97486 (invariant!0 (currentBit!13661 thiss!1939) (currentByte!13666 thiss!1939) (size!7131 (buf!7377 thiss!1939)))))

(assert (=> d!97486 (= (bitIndex!0 (size!7131 (buf!7377 thiss!1939)) (currentByte!13666 thiss!1939) (currentBit!13661 thiss!1939)) lt!418196)))

(declare-fun b!283775 () Bool)

(declare-fun res!235166 () Bool)

(assert (=> b!283775 (=> (not res!235166) (not e!202698))))

(assert (=> b!283775 (= res!235166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418196))))

(declare-fun b!283776 () Bool)

(declare-fun lt!418197 () (_ BitVec 64))

(assert (=> b!283776 (= e!202698 (bvsle lt!418196 (bvmul lt!418197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283776 (or (= lt!418197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418197)))))

(assert (=> b!283776 (= lt!418197 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))))))

(assert (= (and d!97486 res!235165) b!283775))

(assert (= (and b!283775 res!235166) b!283776))

(assert (=> d!97486 m!416837))

(assert (=> d!97486 m!416839))

(assert (=> b!283752 d!97486))

(declare-fun d!97488 () Bool)

(assert (=> d!97488 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13661 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13661 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24611 () Bool)

(assert (= bs!24611 d!97488))

(assert (=> bs!24611 m!416837))

(assert (=> d!97454 d!97488))

(declare-fun d!97490 () Bool)

(assert (=> d!97490 (= (remainingBits!0 ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) ((_ sign_extend 32) (currentByte!13666 thiss!1939)) ((_ sign_extend 32) (currentBit!13661 thiss!1939))) (bvsub (bvmul ((_ sign_extend 32) (size!7131 (buf!7377 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13666 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13661 thiss!1939)))))))

(assert (=> d!97450 d!97490))

(declare-fun d!97492 () Bool)

(assert (=> d!97492 (= (invariant!0 (currentBit!13661 thiss!1939) (currentByte!13666 thiss!1939) (size!7131 (buf!7377 thiss!1939))) (and (bvsge (currentBit!13661 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13661 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13666 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13666 thiss!1939) (size!7131 (buf!7377 thiss!1939))) (and (= (currentBit!13661 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13666 thiss!1939) (size!7131 (buf!7377 thiss!1939)))))))))

(assert (=> d!97452 d!97492))

(push 1)

(assert (not d!97484))

(assert (not d!97486))

(assert (not d!97488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

