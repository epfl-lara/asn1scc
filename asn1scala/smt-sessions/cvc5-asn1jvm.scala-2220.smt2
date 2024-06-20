; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56260 () Bool)

(assert start!56260)

(declare-fun res!218095 () Bool)

(declare-fun e!181016 () Bool)

(assert (=> start!56260 (=> (not res!218095) (not e!181016))))

(declare-datatypes ((array!14325 0))(
  ( (array!14326 (arr!7252 (Array (_ BitVec 32) (_ BitVec 8))) (size!6265 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11452 0))(
  ( (BitStream!11453 (buf!6787 array!14325) (currentByte!12484 (_ BitVec 32)) (currentBit!12479 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11452)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56260 (= res!218095 (validate_offset_bit!0 ((_ sign_extend 32) (size!6265 (buf!6787 thiss!914))) ((_ sign_extend 32) (currentByte!12484 thiss!914)) ((_ sign_extend 32) (currentBit!12479 thiss!914))))))

(assert (=> start!56260 e!181016))

(declare-fun e!181017 () Bool)

(declare-fun inv!12 (BitStream!11452) Bool)

(assert (=> start!56260 (and (inv!12 thiss!914) e!181017)))

(assert (=> start!56260 true))

(declare-fun b!260535 () Bool)

(declare-datatypes ((Unit!18507 0))(
  ( (Unit!18508) )
))
(declare-datatypes ((tuple2!22328 0))(
  ( (tuple2!22329 (_1!12100 Unit!18507) (_2!12100 BitStream!11452)) )
))
(declare-fun lt!402667 () tuple2!22328)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!260535 (= e!181016 (not (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6265 (buf!6787 (_2!12100 lt!402667)))) ((_ sign_extend 32) (currentByte!12484 (_2!12100 lt!402667))) ((_ sign_extend 32) (currentBit!12479 (_2!12100 lt!402667)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayRangesEq!932 (array!14325 array!14325 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260535 (arrayRangesEq!932 (buf!6787 thiss!914) (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))) (size!6265 (buf!6787 thiss!914))) #b00000000000000000000000000000000 (currentByte!12484 (_2!12100 lt!402667)))))

(declare-fun lt!402668 () Unit!18507)

(declare-fun arrayUpdatedAtPrefixLemma!448 (array!14325 (_ BitVec 32) (_ BitVec 8)) Unit!18507)

(assert (=> b!260535 (= lt!402668 (arrayUpdatedAtPrefixLemma!448 (buf!6787 thiss!914) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18509 () Unit!18507)

(declare-fun Unit!18510 () Unit!18507)

(assert (=> b!260535 (= lt!402667 (ite b!187 (tuple2!22329 Unit!18509 (BitStream!11453 (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12479 thiss!914)))))) (size!6265 (buf!6787 thiss!914))) (currentByte!12484 thiss!914) (currentBit!12479 thiss!914))) (tuple2!22329 Unit!18510 (BitStream!11453 (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12479 thiss!914))))))) (size!6265 (buf!6787 thiss!914))) (currentByte!12484 thiss!914) (currentBit!12479 thiss!914)))))))

(declare-fun b!260536 () Bool)

(declare-fun array_inv!6006 (array!14325) Bool)

(assert (=> b!260536 (= e!181017 (array_inv!6006 (buf!6787 thiss!914)))))

(assert (= (and start!56260 res!218095) b!260535))

(assert (= start!56260 b!260536))

(declare-fun m!389853 () Bool)

(assert (=> start!56260 m!389853))

(declare-fun m!389855 () Bool)

(assert (=> start!56260 m!389855))

(declare-fun m!389857 () Bool)

(assert (=> b!260535 m!389857))

(declare-fun m!389859 () Bool)

(assert (=> b!260535 m!389859))

(declare-fun m!389861 () Bool)

(assert (=> b!260535 m!389861))

(declare-fun m!389863 () Bool)

(assert (=> b!260535 m!389863))

(declare-fun m!389865 () Bool)

(assert (=> b!260535 m!389865))

(declare-fun m!389867 () Bool)

(assert (=> b!260535 m!389867))

(declare-fun m!389869 () Bool)

(assert (=> b!260535 m!389869))

(assert (=> b!260535 m!389863))

(declare-fun m!389871 () Bool)

(assert (=> b!260535 m!389871))

(declare-fun m!389873 () Bool)

(assert (=> b!260535 m!389873))

(declare-fun m!389875 () Bool)

(assert (=> b!260536 m!389875))

(push 1)

(assert (not b!260535))

(assert (not start!56260))

(assert (not b!260536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87482 () Bool)

(assert (=> d!87482 (= (remainingBits!0 ((_ sign_extend 32) (size!6265 (buf!6787 (_2!12100 lt!402667)))) ((_ sign_extend 32) (currentByte!12484 (_2!12100 lt!402667))) ((_ sign_extend 32) (currentBit!12479 (_2!12100 lt!402667)))) (bvsub (bvmul ((_ sign_extend 32) (size!6265 (buf!6787 (_2!12100 lt!402667)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12484 (_2!12100 lt!402667))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12479 (_2!12100 lt!402667))))))))

(assert (=> b!260535 d!87482))

(declare-fun d!87484 () Bool)

(declare-fun res!218106 () Bool)

(declare-fun e!181041 () Bool)

(assert (=> d!87484 (=> res!218106 e!181041)))

(assert (=> d!87484 (= res!218106 (= #b00000000000000000000000000000000 (currentByte!12484 (_2!12100 lt!402667))))))

(assert (=> d!87484 (= (arrayRangesEq!932 (buf!6787 thiss!914) (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))) (size!6265 (buf!6787 thiss!914))) #b00000000000000000000000000000000 (currentByte!12484 (_2!12100 lt!402667))) e!181041)))

(declare-fun b!260553 () Bool)

(declare-fun e!181042 () Bool)

(assert (=> b!260553 (= e!181041 e!181042)))

(declare-fun res!218107 () Bool)

(assert (=> b!260553 (=> (not res!218107) (not e!181042))))

(assert (=> b!260553 (= res!218107 (= (select (arr!7252 (buf!6787 thiss!914)) #b00000000000000000000000000000000) (select (arr!7252 (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))) (size!6265 (buf!6787 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260554 () Bool)

(assert (=> b!260554 (= e!181042 (arrayRangesEq!932 (buf!6787 thiss!914) (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))) (size!6265 (buf!6787 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12484 (_2!12100 lt!402667))))))

(assert (= (and d!87484 (not res!218106)) b!260553))

(assert (= (and b!260553 res!218107) b!260554))

(declare-fun m!389925 () Bool)

(assert (=> b!260553 m!389925))

(declare-fun m!389927 () Bool)

(assert (=> b!260553 m!389927))

(declare-fun m!389929 () Bool)

(assert (=> b!260554 m!389929))

(assert (=> b!260535 d!87484))

(declare-fun d!87486 () Bool)

(declare-fun e!181049 () Bool)

(assert (=> d!87486 e!181049))

(declare-fun res!218114 () Bool)

(assert (=> d!87486 (=> (not res!218114) (not e!181049))))

(assert (=> d!87486 (= res!218114 (and (bvsge (currentByte!12484 (_2!12100 lt!402667)) #b00000000000000000000000000000000) (bvslt (currentByte!12484 (_2!12100 lt!402667)) (size!6265 (buf!6787 thiss!914)))))))

(declare-fun lt!402683 () Unit!18507)

(declare-fun choose!342 (array!14325 (_ BitVec 32) (_ BitVec 8)) Unit!18507)

(assert (=> d!87486 (= lt!402683 (choose!342 (buf!6787 thiss!914) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))))))

(assert (=> d!87486 (and (bvsle #b00000000000000000000000000000000 (currentByte!12484 (_2!12100 lt!402667))) (bvslt (currentByte!12484 (_2!12100 lt!402667)) (size!6265 (buf!6787 thiss!914))))))

(assert (=> d!87486 (= (arrayUpdatedAtPrefixLemma!448 (buf!6787 thiss!914) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))) lt!402683)))

(declare-fun b!260561 () Bool)

(assert (=> b!260561 (= e!181049 (arrayRangesEq!932 (buf!6787 thiss!914) (array!14326 (store (arr!7252 (buf!6787 thiss!914)) (currentByte!12484 (_2!12100 lt!402667)) (select (arr!7252 (buf!6787 (_2!12100 lt!402667))) (currentByte!12484 (_2!12100 lt!402667)))) (size!6265 (buf!6787 thiss!914))) #b00000000000000000000000000000000 (currentByte!12484 (_2!12100 lt!402667))))))

(assert (= (and d!87486 res!218114) b!260561))

(assert (=> d!87486 m!389863))

(declare-fun m!389931 () Bool)

(assert (=> d!87486 m!389931))

(assert (=> b!260561 m!389867))

(assert (=> b!260561 m!389861))

(assert (=> b!260535 d!87486))

(declare-fun d!87494 () Bool)

(assert (=> d!87494 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6265 (buf!6787 thiss!914))) ((_ sign_extend 32) (currentByte!12484 thiss!914)) ((_ sign_extend 32) (currentBit!12479 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6265 (buf!6787 thiss!914))) ((_ sign_extend 32) (currentByte!12484 thiss!914)) ((_ sign_extend 32) (currentBit!12479 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22178 () Bool)

(assert (= bs!22178 d!87494))

(declare-fun m!389939 () Bool)

(assert (=> bs!22178 m!389939))

(assert (=> start!56260 d!87494))

(declare-fun d!87500 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87500 (= (inv!12 thiss!914) (invariant!0 (currentBit!12479 thiss!914) (currentByte!12484 thiss!914) (size!6265 (buf!6787 thiss!914))))))

(declare-fun bs!22179 () Bool)

(assert (= bs!22179 d!87500))

(declare-fun m!389941 () Bool)

(assert (=> bs!22179 m!389941))

(assert (=> start!56260 d!87500))

(declare-fun d!87502 () Bool)

(assert (=> d!87502 (= (array_inv!6006 (buf!6787 thiss!914)) (bvsge (size!6265 (buf!6787 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260536 d!87502))

(push 1)

(assert (not b!260561))

(assert (not b!260554))

(assert (not d!87486))

(assert (not d!87500))

(assert (not d!87494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

