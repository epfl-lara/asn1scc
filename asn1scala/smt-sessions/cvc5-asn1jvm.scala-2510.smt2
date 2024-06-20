; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63448 () Bool)

(assert start!63448)

(declare-fun res!235118 () Bool)

(declare-fun e!202648 () Bool)

(assert (=> start!63448 (=> (not res!235118) (not e!202648))))

(declare-datatypes ((array!16510 0))(
  ( (array!16511 (arr!8125 (Array (_ BitVec 32) (_ BitVec 8))) (size!7129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12628 0))(
  ( (BitStream!12629 (buf!7375 array!16510) (currentByte!13664 (_ BitVec 32)) (currentBit!13659 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12628)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63448 (= res!235118 (validate_offset_bits!1 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13664 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13659 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63448 e!202648))

(declare-fun e!202650 () Bool)

(declare-fun inv!12 (BitStream!12628) Bool)

(assert (=> start!63448 (and (inv!12 thiss!1939) e!202650)))

(declare-fun b!283721 () Bool)

(declare-datatypes ((Unit!19871 0))(
  ( (Unit!19872) )
))
(declare-datatypes ((tuple2!22602 0))(
  ( (tuple2!22603 (_1!12495 Unit!19871) (_2!12495 BitStream!12628)) )
))
(declare-fun lt!418095 () tuple2!22602)

(assert (=> b!283721 (= e!202648 (and (= (bvand (currentByte!13664 (_2!12495 lt!418095)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!13664 (_2!12495 lt!418095)) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!13664 (_2!12495 lt!418095))) #b10000000000000000000000000000000)))))))

(declare-fun alignToByte!0 (BitStream!12628) tuple2!22602)

(assert (=> b!283721 (= lt!418095 (alignToByte!0 thiss!1939))))

(declare-fun b!283722 () Bool)

(declare-fun array_inv!6822 (array!16510) Bool)

(assert (=> b!283722 (= e!202650 (array_inv!6822 (buf!7375 thiss!1939)))))

(assert (= (and start!63448 res!235118) b!283721))

(assert (= start!63448 b!283722))

(declare-fun m!416809 () Bool)

(assert (=> start!63448 m!416809))

(declare-fun m!416811 () Bool)

(assert (=> start!63448 m!416811))

(declare-fun m!416813 () Bool)

(assert (=> b!283721 m!416813))

(declare-fun m!416815 () Bool)

(assert (=> b!283722 m!416815))

(push 1)

(assert (not b!283721))

(assert (not b!283722))

(assert (not start!63448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97440 () Bool)

(declare-fun e!202676 () Bool)

(assert (=> d!97440 e!202676))

(declare-fun res!235132 () Bool)

(assert (=> d!97440 (=> (not res!235132) (not e!202676))))

(assert (=> d!97440 (= res!235132 (validate_offset_bits!1 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13659 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun Unit!19877 () Unit!19871)

(declare-fun Unit!19878 () Unit!19871)

(assert (=> d!97440 (= (alignToByte!0 thiss!1939) (ite (not (= (currentBit!13659 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22603 Unit!19877 (BitStream!12629 (buf!7375 thiss!1939) (bvadd (currentByte!13664 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22603 Unit!19878 thiss!1939)))))

(declare-fun b!283741 () Bool)

(declare-fun e!202675 () Bool)

(assert (=> b!283741 (= e!202676 e!202675)))

(declare-fun res!235131 () Bool)

(assert (=> b!283741 (=> (not res!235131) (not e!202675))))

(declare-fun lt!418110 () tuple2!22602)

(assert (=> b!283741 (= res!235131 (= (buf!7375 (_2!12495 lt!418110)) (buf!7375 thiss!1939)))))

(declare-fun Unit!19879 () Unit!19871)

(declare-fun Unit!19880 () Unit!19871)

(assert (=> b!283741 (= lt!418110 (ite (not (= (currentBit!13659 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22603 Unit!19879 (BitStream!12629 (buf!7375 thiss!1939) (bvadd (currentByte!13664 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22603 Unit!19880 thiss!1939)))))

(declare-fun lt!418111 () (_ BitVec 64))

(declare-fun b!283742 () Bool)

(declare-fun lt!418112 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!283742 (= e!202675 (bvsle (bitIndex!0 (size!7129 (buf!7375 (_2!12495 lt!418110))) (currentByte!13664 (_2!12495 lt!418110)) (currentBit!13659 (_2!12495 lt!418110))) (bvadd lt!418111 lt!418112)))))

(assert (=> b!283742 (or (not (= (bvand lt!418111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418112 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!418111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!418111 lt!418112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!283742 (= lt!418112 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!283742 (= lt!418111 (bitIndex!0 (size!7129 (buf!7375 thiss!1939)) (currentByte!13664 thiss!1939) (currentBit!13659 thiss!1939)))))

(assert (= (and d!97440 res!235132) b!283741))

(assert (= (and b!283741 res!235131) b!283742))

(declare-fun m!416841 () Bool)

(assert (=> d!97440 m!416841))

(declare-fun m!416843 () Bool)

(assert (=> b!283742 m!416843))

(declare-fun m!416845 () Bool)

(assert (=> b!283742 m!416845))

(assert (=> b!283721 d!97440))

(declare-fun d!97456 () Bool)

(assert (=> d!97456 (= (array_inv!6822 (buf!7375 thiss!1939)) (bvsge (size!7129 (buf!7375 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283722 d!97456))

(declare-fun d!97458 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97458 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13664 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13659 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13664 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13659 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24607 () Bool)

(assert (= bs!24607 d!97458))

(declare-fun m!416847 () Bool)

(assert (=> bs!24607 m!416847))

(assert (=> start!63448 d!97458))

(declare-fun d!97460 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97460 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13659 thiss!1939) (currentByte!13664 thiss!1939) (size!7129 (buf!7375 thiss!1939))))))

(declare-fun bs!24608 () Bool)

(assert (= bs!24608 d!97460))

(declare-fun m!416851 () Bool)

(assert (=> bs!24608 m!416851))

(assert (=> start!63448 d!97460))

(push 1)

(assert (not d!97458))

(assert (not d!97460))

(assert (not d!97440))

(assert (not b!283742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97472 () Bool)

(assert (=> d!97472 (= (remainingBits!0 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939))) (bvsub (bvmul ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13664 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13659 thiss!1939)))))))

(assert (=> d!97458 d!97472))

(declare-fun d!97474 () Bool)

(assert (=> d!97474 (= (invariant!0 (currentBit!13659 thiss!1939) (currentByte!13664 thiss!1939) (size!7129 (buf!7375 thiss!1939))) (and (bvsge (currentBit!13659 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13659 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13664 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13664 thiss!1939) (size!7129 (buf!7375 thiss!1939))) (and (= (currentBit!13659 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13664 thiss!1939) (size!7129 (buf!7375 thiss!1939)))))))))

(assert (=> d!97460 d!97474))

(declare-fun d!97476 () Bool)

(assert (=> d!97476 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13659 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13659 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24610 () Bool)

(assert (= bs!24610 d!97476))

(assert (=> bs!24610 m!416847))

(assert (=> d!97440 d!97476))

(declare-fun d!97478 () Bool)

(declare-fun e!202693 () Bool)

(assert (=> d!97478 e!202693))

(declare-fun res!235155 () Bool)

(assert (=> d!97478 (=> (not res!235155) (not e!202693))))

(declare-fun lt!418169 () (_ BitVec 64))

(declare-fun lt!418170 () (_ BitVec 64))

(declare-fun lt!418168 () (_ BitVec 64))

(assert (=> d!97478 (= res!235155 (= lt!418169 (bvsub lt!418168 lt!418170)))))

(assert (=> d!97478 (or (= (bvand lt!418168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418168 lt!418170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97478 (= lt!418170 (remainingBits!0 ((_ sign_extend 32) (size!7129 (buf!7375 (_2!12495 lt!418110)))) ((_ sign_extend 32) (currentByte!13664 (_2!12495 lt!418110))) ((_ sign_extend 32) (currentBit!13659 (_2!12495 lt!418110)))))))

(declare-fun lt!418166 () (_ BitVec 64))

(declare-fun lt!418167 () (_ BitVec 64))

(assert (=> d!97478 (= lt!418168 (bvmul lt!418166 lt!418167))))

(assert (=> d!97478 (or (= lt!418166 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418167 (bvsdiv (bvmul lt!418166 lt!418167) lt!418166)))))

(assert (=> d!97478 (= lt!418167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97478 (= lt!418166 ((_ sign_extend 32) (size!7129 (buf!7375 (_2!12495 lt!418110)))))))

(assert (=> d!97478 (= lt!418169 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13664 (_2!12495 lt!418110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13659 (_2!12495 lt!418110)))))))

(assert (=> d!97478 (invariant!0 (currentBit!13659 (_2!12495 lt!418110)) (currentByte!13664 (_2!12495 lt!418110)) (size!7129 (buf!7375 (_2!12495 lt!418110))))))

(assert (=> d!97478 (= (bitIndex!0 (size!7129 (buf!7375 (_2!12495 lt!418110))) (currentByte!13664 (_2!12495 lt!418110)) (currentBit!13659 (_2!12495 lt!418110))) lt!418169)))

(declare-fun b!283765 () Bool)

(declare-fun res!235156 () Bool)

(assert (=> b!283765 (=> (not res!235156) (not e!202693))))

(assert (=> b!283765 (= res!235156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418169))))

(declare-fun b!283766 () Bool)

(declare-fun lt!418165 () (_ BitVec 64))

(assert (=> b!283766 (= e!202693 (bvsle lt!418169 (bvmul lt!418165 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283766 (or (= lt!418165 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418165 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418165)))))

(assert (=> b!283766 (= lt!418165 ((_ sign_extend 32) (size!7129 (buf!7375 (_2!12495 lt!418110)))))))

(assert (= (and d!97478 res!235155) b!283765))

(assert (= (and b!283765 res!235156) b!283766))

(declare-fun m!416867 () Bool)

(assert (=> d!97478 m!416867))

(declare-fun m!416869 () Bool)

(assert (=> d!97478 m!416869))

(assert (=> b!283742 d!97478))

(declare-fun d!97482 () Bool)

(declare-fun e!202694 () Bool)

(assert (=> d!97482 e!202694))

(declare-fun res!235157 () Bool)

(assert (=> d!97482 (=> (not res!235157) (not e!202694))))

(declare-fun lt!418176 () (_ BitVec 64))

(declare-fun lt!418175 () (_ BitVec 64))

(declare-fun lt!418174 () (_ BitVec 64))

(assert (=> d!97482 (= res!235157 (= lt!418175 (bvsub lt!418174 lt!418176)))))

(assert (=> d!97482 (or (= (bvand lt!418174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418174 lt!418176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97482 (= lt!418176 (remainingBits!0 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))) ((_ sign_extend 32) (currentByte!13664 thiss!1939)) ((_ sign_extend 32) (currentBit!13659 thiss!1939))))))

(declare-fun lt!418172 () (_ BitVec 64))

(declare-fun lt!418173 () (_ BitVec 64))

(assert (=> d!97482 (= lt!418174 (bvmul lt!418172 lt!418173))))

(assert (=> d!97482 (or (= lt!418172 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418173 (bvsdiv (bvmul lt!418172 lt!418173) lt!418172)))))

(assert (=> d!97482 (= lt!418173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97482 (= lt!418172 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))))))

(assert (=> d!97482 (= lt!418175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13664 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13659 thiss!1939))))))

(assert (=> d!97482 (invariant!0 (currentBit!13659 thiss!1939) (currentByte!13664 thiss!1939) (size!7129 (buf!7375 thiss!1939)))))

(assert (=> d!97482 (= (bitIndex!0 (size!7129 (buf!7375 thiss!1939)) (currentByte!13664 thiss!1939) (currentBit!13659 thiss!1939)) lt!418175)))

(declare-fun b!283767 () Bool)

(declare-fun res!235158 () Bool)

(assert (=> b!283767 (=> (not res!235158) (not e!202694))))

(assert (=> b!283767 (= res!235158 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418175))))

(declare-fun b!283768 () Bool)

(declare-fun lt!418171 () (_ BitVec 64))

(assert (=> b!283768 (= e!202694 (bvsle lt!418175 (bvmul lt!418171 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283768 (or (= lt!418171 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418171 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418171)))))

(assert (=> b!283768 (= lt!418171 ((_ sign_extend 32) (size!7129 (buf!7375 thiss!1939))))))

(assert (= (and d!97482 res!235157) b!283767))

(assert (= (and b!283767 res!235158) b!283768))

(assert (=> d!97482 m!416847))

(assert (=> d!97482 m!416851))

(assert (=> b!283742 d!97482))

(push 1)

(assert (not d!97478))

(assert (not d!97476))

(assert (not d!97482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

