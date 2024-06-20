; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56306 () Bool)

(assert start!56306)

(declare-fun res!218146 () Bool)

(declare-fun e!181099 () Bool)

(assert (=> start!56306 (=> (not res!218146) (not e!181099))))

(declare-datatypes ((array!14338 0))(
  ( (array!14339 (arr!7257 (Array (_ BitVec 32) (_ BitVec 8))) (size!6270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11462 0))(
  ( (BitStream!11463 (buf!6792 array!14338) (currentByte!12495 (_ BitVec 32)) (currentBit!12490 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11462)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56306 (= res!218146 (validate_offset_bit!0 ((_ sign_extend 32) (size!6270 (buf!6792 thiss!914))) ((_ sign_extend 32) (currentByte!12495 thiss!914)) ((_ sign_extend 32) (currentBit!12490 thiss!914))))))

(assert (=> start!56306 e!181099))

(declare-fun e!181097 () Bool)

(declare-fun inv!12 (BitStream!11462) Bool)

(assert (=> start!56306 (and (inv!12 thiss!914) e!181097)))

(assert (=> start!56306 true))

(declare-fun b!260600 () Bool)

(declare-fun e!181096 () Bool)

(assert (=> b!260600 (= e!181099 (not e!181096))))

(declare-fun res!218145 () Bool)

(assert (=> b!260600 (=> res!218145 e!181096)))

(declare-datatypes ((Unit!18527 0))(
  ( (Unit!18528) )
))
(declare-datatypes ((tuple2!22338 0))(
  ( (tuple2!22339 (_1!12105 Unit!18527) (_2!12105 BitStream!11462)) )
))
(declare-fun lt!402716 () tuple2!22338)

(assert (=> b!260600 (= res!218145 (not (= (size!6270 (buf!6792 thiss!914)) (size!6270 (buf!6792 (_2!12105 lt!402716))))))))

(declare-fun lt!402715 () tuple2!22338)

(declare-fun increaseBitIndex!0 (BitStream!11462) tuple2!22338)

(assert (=> b!260600 (= lt!402716 (increaseBitIndex!0 (_2!12105 lt!402715)))))

(declare-fun arrayRangesEq!937 (array!14338 array!14338 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260600 (arrayRangesEq!937 (buf!6792 thiss!914) (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))) (size!6270 (buf!6792 thiss!914))) #b00000000000000000000000000000000 (currentByte!12495 (_2!12105 lt!402715)))))

(declare-fun lt!402714 () Unit!18527)

(declare-fun arrayUpdatedAtPrefixLemma!453 (array!14338 (_ BitVec 32) (_ BitVec 8)) Unit!18527)

(assert (=> b!260600 (= lt!402714 (arrayUpdatedAtPrefixLemma!453 (buf!6792 thiss!914) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18529 () Unit!18527)

(declare-fun Unit!18530 () Unit!18527)

(assert (=> b!260600 (= lt!402715 (ite b!187 (tuple2!22339 Unit!18529 (BitStream!11463 (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12490 thiss!914)))))) (size!6270 (buf!6792 thiss!914))) (currentByte!12495 thiss!914) (currentBit!12490 thiss!914))) (tuple2!22339 Unit!18530 (BitStream!11463 (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12490 thiss!914))))))) (size!6270 (buf!6792 thiss!914))) (currentByte!12495 thiss!914) (currentBit!12490 thiss!914)))))))

(declare-fun b!260601 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260601 (= e!181096 (invariant!0 (currentBit!12490 (_2!12105 lt!402716)) (currentByte!12495 (_2!12105 lt!402716)) (size!6270 (buf!6792 (_2!12105 lt!402716)))))))

(declare-fun b!260602 () Bool)

(declare-fun array_inv!6011 (array!14338) Bool)

(assert (=> b!260602 (= e!181097 (array_inv!6011 (buf!6792 thiss!914)))))

(assert (= (and start!56306 res!218146) b!260600))

(assert (= (and b!260600 (not res!218145)) b!260601))

(assert (= start!56306 b!260602))

(declare-fun m!390013 () Bool)

(assert (=> start!56306 m!390013))

(declare-fun m!390015 () Bool)

(assert (=> start!56306 m!390015))

(declare-fun m!390017 () Bool)

(assert (=> b!260600 m!390017))

(declare-fun m!390019 () Bool)

(assert (=> b!260600 m!390019))

(declare-fun m!390021 () Bool)

(assert (=> b!260600 m!390021))

(declare-fun m!390023 () Bool)

(assert (=> b!260600 m!390023))

(declare-fun m!390025 () Bool)

(assert (=> b!260600 m!390025))

(assert (=> b!260600 m!390023))

(declare-fun m!390027 () Bool)

(assert (=> b!260600 m!390027))

(declare-fun m!390029 () Bool)

(assert (=> b!260600 m!390029))

(declare-fun m!390031 () Bool)

(assert (=> b!260600 m!390031))

(declare-fun m!390033 () Bool)

(assert (=> b!260600 m!390033))

(declare-fun m!390035 () Bool)

(assert (=> b!260601 m!390035))

(declare-fun m!390037 () Bool)

(assert (=> b!260602 m!390037))

(push 1)

(assert (not b!260602))

(assert (not b!260600))

(assert (not b!260601))

(assert (not start!56306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87522 () Bool)

(assert (=> d!87522 (= (array_inv!6011 (buf!6792 thiss!914)) (bvsge (size!6270 (buf!6792 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260602 d!87522))

(declare-fun d!87524 () Bool)

(declare-fun e!181111 () Bool)

(assert (=> d!87524 e!181111))

(declare-fun res!218163 () Bool)

(assert (=> d!87524 (=> (not res!218163) (not e!181111))))

(declare-fun lt!402746 () (_ BitVec 64))

(declare-fun lt!402744 () tuple2!22338)

(declare-fun lt!402743 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!87524 (= res!218163 (= (bvadd lt!402746 lt!402743) (bitIndex!0 (size!6270 (buf!6792 (_2!12105 lt!402744))) (currentByte!12495 (_2!12105 lt!402744)) (currentBit!12490 (_2!12105 lt!402744)))))))

(assert (=> d!87524 (or (not (= (bvand lt!402746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402743 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402746 lt!402743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87524 (= lt!402743 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87524 (= lt!402746 (bitIndex!0 (size!6270 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)) (currentBit!12490 (_2!12105 lt!402715))))))

(declare-fun Unit!18533 () Unit!18527)

(declare-fun Unit!18534 () Unit!18527)

(assert (=> d!87524 (= lt!402744 (ite (bvslt (currentBit!12490 (_2!12105 lt!402715)) #b00000000000000000000000000000111) (tuple2!22339 Unit!18533 (BitStream!11463 (buf!6792 (_2!12105 lt!402715)) (currentByte!12495 (_2!12105 lt!402715)) (bvadd (currentBit!12490 (_2!12105 lt!402715)) #b00000000000000000000000000000001))) (tuple2!22339 Unit!18534 (BitStream!11463 (buf!6792 (_2!12105 lt!402715)) (bvadd (currentByte!12495 (_2!12105 lt!402715)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87524 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6270 (buf!6792 (_2!12105 lt!402715)))) ((_ sign_extend 32) (currentByte!12495 (_2!12105 lt!402715))) ((_ sign_extend 32) (currentBit!12490 (_2!12105 lt!402715)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87524 (= (increaseBitIndex!0 (_2!12105 lt!402715)) lt!402744)))

(declare-fun b!260619 () Bool)

(declare-fun res!218164 () Bool)

(assert (=> b!260619 (=> (not res!218164) (not e!181111))))

(declare-fun lt!402745 () (_ BitVec 64))

(declare-fun lt!402742 () (_ BitVec 64))

(assert (=> b!260619 (= res!218164 (= (bvsub lt!402745 lt!402742) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260619 (or (= (bvand lt!402745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402745 lt!402742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260619 (= lt!402742 (remainingBits!0 ((_ sign_extend 32) (size!6270 (buf!6792 (_2!12105 lt!402744)))) ((_ sign_extend 32) (currentByte!12495 (_2!12105 lt!402744))) ((_ sign_extend 32) (currentBit!12490 (_2!12105 lt!402744)))))))

(assert (=> b!260619 (= lt!402745 (remainingBits!0 ((_ sign_extend 32) (size!6270 (buf!6792 (_2!12105 lt!402715)))) ((_ sign_extend 32) (currentByte!12495 (_2!12105 lt!402715))) ((_ sign_extend 32) (currentBit!12490 (_2!12105 lt!402715)))))))

(declare-fun b!260620 () Bool)

(assert (=> b!260620 (= e!181111 (= (size!6270 (buf!6792 (_2!12105 lt!402715))) (size!6270 (buf!6792 (_2!12105 lt!402744)))))))

(assert (= (and d!87524 res!218163) b!260619))

(assert (= (and b!260619 res!218164) b!260620))

(declare-fun m!390053 () Bool)

(assert (=> d!87524 m!390053))

(declare-fun m!390055 () Bool)

(assert (=> d!87524 m!390055))

(declare-fun m!390057 () Bool)

(assert (=> d!87524 m!390057))

(declare-fun m!390059 () Bool)

(assert (=> b!260619 m!390059))

(assert (=> b!260619 m!390057))

(assert (=> b!260600 d!87524))

(declare-fun d!87532 () Bool)

(declare-fun res!218172 () Bool)

(declare-fun e!181119 () Bool)

(assert (=> d!87532 (=> res!218172 e!181119)))

(assert (=> d!87532 (= res!218172 (= #b00000000000000000000000000000000 (currentByte!12495 (_2!12105 lt!402715))))))

(assert (=> d!87532 (= (arrayRangesEq!937 (buf!6792 thiss!914) (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))) (size!6270 (buf!6792 thiss!914))) #b00000000000000000000000000000000 (currentByte!12495 (_2!12105 lt!402715))) e!181119)))

(declare-fun b!260628 () Bool)

(declare-fun e!181120 () Bool)

(assert (=> b!260628 (= e!181119 e!181120)))

(declare-fun res!218173 () Bool)

(assert (=> b!260628 (=> (not res!218173) (not e!181120))))

(assert (=> b!260628 (= res!218173 (= (select (arr!7257 (buf!6792 thiss!914)) #b00000000000000000000000000000000) (select (arr!7257 (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))) (size!6270 (buf!6792 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260629 () Bool)

(assert (=> b!260629 (= e!181120 (arrayRangesEq!937 (buf!6792 thiss!914) (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))) (size!6270 (buf!6792 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12495 (_2!12105 lt!402715))))))

(assert (= (and d!87532 (not res!218172)) b!260628))

(assert (= (and b!260628 res!218173) b!260629))

(declare-fun m!390063 () Bool)

(assert (=> b!260628 m!390063))

(declare-fun m!390065 () Bool)

(assert (=> b!260628 m!390065))

(declare-fun m!390067 () Bool)

(assert (=> b!260629 m!390067))

(assert (=> b!260600 d!87532))

(declare-fun d!87536 () Bool)

(declare-fun e!181125 () Bool)

(assert (=> d!87536 e!181125))

(declare-fun res!218180 () Bool)

(assert (=> d!87536 (=> (not res!218180) (not e!181125))))

(assert (=> d!87536 (= res!218180 (and (bvsge (currentByte!12495 (_2!12105 lt!402715)) #b00000000000000000000000000000000) (bvslt (currentByte!12495 (_2!12105 lt!402715)) (size!6270 (buf!6792 thiss!914)))))))

(declare-fun lt!402762 () Unit!18527)

(declare-fun choose!346 (array!14338 (_ BitVec 32) (_ BitVec 8)) Unit!18527)

(assert (=> d!87536 (= lt!402762 (choose!346 (buf!6792 thiss!914) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))))))

(assert (=> d!87536 (and (bvsle #b00000000000000000000000000000000 (currentByte!12495 (_2!12105 lt!402715))) (bvslt (currentByte!12495 (_2!12105 lt!402715)) (size!6270 (buf!6792 thiss!914))))))

(assert (=> d!87536 (= (arrayUpdatedAtPrefixLemma!453 (buf!6792 thiss!914) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))) lt!402762)))

(declare-fun b!260636 () Bool)

(assert (=> b!260636 (= e!181125 (arrayRangesEq!937 (buf!6792 thiss!914) (array!14339 (store (arr!7257 (buf!6792 thiss!914)) (currentByte!12495 (_2!12105 lt!402715)) (select (arr!7257 (buf!6792 (_2!12105 lt!402715))) (currentByte!12495 (_2!12105 lt!402715)))) (size!6270 (buf!6792 thiss!914))) #b00000000000000000000000000000000 (currentByte!12495 (_2!12105 lt!402715))))))

(assert (= (and d!87536 res!218180) b!260636))

(assert (=> d!87536 m!390023))

(declare-fun m!390073 () Bool)

(assert (=> d!87536 m!390073))

(assert (=> b!260636 m!390029))

(assert (=> b!260636 m!390017))

(assert (=> b!260600 d!87536))

(declare-fun d!87544 () Bool)

(assert (=> d!87544 (= (invariant!0 (currentBit!12490 (_2!12105 lt!402716)) (currentByte!12495 (_2!12105 lt!402716)) (size!6270 (buf!6792 (_2!12105 lt!402716)))) (and (bvsge (currentBit!12490 (_2!12105 lt!402716)) #b00000000000000000000000000000000) (bvslt (currentBit!12490 (_2!12105 lt!402716)) #b00000000000000000000000000001000) (bvsge (currentByte!12495 (_2!12105 lt!402716)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12495 (_2!12105 lt!402716)) (size!6270 (buf!6792 (_2!12105 lt!402716)))) (and (= (currentBit!12490 (_2!12105 lt!402716)) #b00000000000000000000000000000000) (= (currentByte!12495 (_2!12105 lt!402716)) (size!6270 (buf!6792 (_2!12105 lt!402716))))))))))

(assert (=> b!260601 d!87544))

(declare-fun d!87546 () Bool)

(assert (=> d!87546 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6270 (buf!6792 thiss!914))) ((_ sign_extend 32) (currentByte!12495 thiss!914)) ((_ sign_extend 32) (currentBit!12490 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6270 (buf!6792 thiss!914))) ((_ sign_extend 32) (currentByte!12495 thiss!914)) ((_ sign_extend 32) (currentBit!12490 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22189 () Bool)

(assert (= bs!22189 d!87546))

(declare-fun m!390083 () Bool)

(assert (=> bs!22189 m!390083))

(assert (=> start!56306 d!87546))

(declare-fun d!87550 () Bool)

(assert (=> d!87550 (= (inv!12 thiss!914) (invariant!0 (currentBit!12490 thiss!914) (currentByte!12495 thiss!914) (size!6270 (buf!6792 thiss!914))))))

(declare-fun bs!22190 () Bool)

(assert (= bs!22190 d!87550))

(declare-fun m!390085 () Bool)

(assert (=> bs!22190 m!390085))

(assert (=> start!56306 d!87550))

(push 1)

(assert (not b!260619))

(assert (not b!260636))

(assert (not d!87550))

(assert (not d!87546))

(assert (not b!260629))

(assert (not d!87536))

(assert (not d!87524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

