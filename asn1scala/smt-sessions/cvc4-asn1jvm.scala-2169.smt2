; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55064 () Bool)

(assert start!55064)

(declare-fun b!257073 () Bool)

(declare-fun e!178219 () Bool)

(declare-datatypes ((array!13951 0))(
  ( (array!13952 (arr!7104 (Array (_ BitVec 32) (_ BitVec 8))) (size!6117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11156 0))(
  ( (BitStream!11157 (buf!6639 array!13951) (currentByte!12169 (_ BitVec 32)) (currentBit!12164 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11156)

(declare-fun array_inv!5858 (array!13951) Bool)

(assert (=> b!257073 (= e!178219 (array_inv!5858 (buf!6639 thiss!1754)))))

(declare-fun b!257074 () Bool)

(declare-fun e!178222 () Bool)

(declare-fun e!178220 () Bool)

(assert (=> b!257074 (= e!178222 e!178220)))

(declare-fun res!215450 () Bool)

(assert (=> b!257074 (=> (not res!215450) (not e!178220))))

(declare-datatypes ((tuple2!21978 0))(
  ( (tuple2!21979 (_1!11925 Bool) (_2!11925 BitStream!11156)) )
))
(declare-fun lt!398357 () tuple2!21978)

(declare-fun expected!109 () Bool)

(assert (=> b!257074 (= res!215450 (not (= (_1!11925 lt!398357) expected!109)))))

(declare-fun readBit!0 (BitStream!11156) tuple2!21978)

(assert (=> b!257074 (= lt!398357 (readBit!0 thiss!1754))))

(declare-fun b!257075 () Bool)

(declare-fun res!215452 () Bool)

(assert (=> b!257075 (=> (not res!215452) (not e!178222))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257075 (= res!215452 (not (= from!526 nBits!535)))))

(declare-fun res!215449 () Bool)

(assert (=> start!55064 (=> (not res!215449) (not e!178222))))

(assert (=> start!55064 (= res!215449 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55064 e!178222))

(assert (=> start!55064 true))

(declare-fun inv!12 (BitStream!11156) Bool)

(assert (=> start!55064 (and (inv!12 thiss!1754) e!178219)))

(declare-fun b!257076 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257076 (= e!178220 (not (invariant!0 (currentBit!12164 (_2!11925 lt!398357)) (currentByte!12169 (_2!11925 lt!398357)) (size!6117 (buf!6639 (_2!11925 lt!398357))))))))

(declare-fun b!257077 () Bool)

(declare-fun res!215451 () Bool)

(assert (=> b!257077 (=> (not res!215451) (not e!178222))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257077 (= res!215451 (validate_offset_bits!1 ((_ sign_extend 32) (size!6117 (buf!6639 thiss!1754))) ((_ sign_extend 32) (currentByte!12169 thiss!1754)) ((_ sign_extend 32) (currentBit!12164 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55064 res!215449) b!257077))

(assert (= (and b!257077 res!215451) b!257075))

(assert (= (and b!257075 res!215452) b!257074))

(assert (= (and b!257074 res!215450) b!257076))

(assert (= start!55064 b!257073))

(declare-fun m!386623 () Bool)

(assert (=> b!257074 m!386623))

(declare-fun m!386625 () Bool)

(assert (=> b!257073 m!386625))

(declare-fun m!386627 () Bool)

(assert (=> b!257077 m!386627))

(declare-fun m!386629 () Bool)

(assert (=> b!257076 m!386629))

(declare-fun m!386631 () Bool)

(assert (=> start!55064 m!386631))

(push 1)

(assert (not b!257073))

(assert (not b!257074))

(assert (not start!55064))

(assert (not b!257077))

(assert (not b!257076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86296 () Bool)

(declare-fun e!178243 () Bool)

(assert (=> d!86296 e!178243))

(declare-fun res!215461 () Bool)

(assert (=> d!86296 (=> (not res!215461) (not e!178243))))

(declare-datatypes ((Unit!18373 0))(
  ( (Unit!18374) )
))
(declare-datatypes ((tuple2!21984 0))(
  ( (tuple2!21985 (_1!11928 Unit!18373) (_2!11928 BitStream!11156)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11156) tuple2!21984)

(assert (=> d!86296 (= res!215461 (= (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754))) (buf!6639 thiss!1754)))))

(declare-fun lt!398420 () Bool)

(assert (=> d!86296 (= lt!398420 (not (= (bvand ((_ sign_extend 24) (select (arr!7104 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12164 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398414 () tuple2!21978)

(assert (=> d!86296 (= lt!398414 (tuple2!21979 (not (= (bvand ((_ sign_extend 24) (select (arr!7104 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12164 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11928 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86296 (validate_offset_bit!0 ((_ sign_extend 32) (size!6117 (buf!6639 thiss!1754))) ((_ sign_extend 32) (currentByte!12169 thiss!1754)) ((_ sign_extend 32) (currentBit!12164 thiss!1754)))))

(assert (=> d!86296 (= (readBit!0 thiss!1754) lt!398414)))

(declare-fun b!257086 () Bool)

(declare-fun lt!398418 () (_ BitVec 64))

(declare-fun lt!398417 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257086 (= e!178243 (= (bitIndex!0 (size!6117 (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754)))) (currentByte!12169 (_2!11928 (increaseBitIndex!0 thiss!1754))) (currentBit!12164 (_2!11928 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398417 lt!398418)))))

(assert (=> b!257086 (or (not (= (bvand lt!398417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398418 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398417 lt!398418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257086 (= lt!398418 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257086 (= lt!398417 (bitIndex!0 (size!6117 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754) (currentBit!12164 thiss!1754)))))

(declare-fun lt!398419 () Bool)

(assert (=> b!257086 (= lt!398419 (not (= (bvand ((_ sign_extend 24) (select (arr!7104 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12164 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398416 () Bool)

(assert (=> b!257086 (= lt!398416 (not (= (bvand ((_ sign_extend 24) (select (arr!7104 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12164 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398415 () Bool)

(assert (=> b!257086 (= lt!398415 (not (= (bvand ((_ sign_extend 24) (select (arr!7104 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12164 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86296 res!215461) b!257086))

(declare-fun m!386659 () Bool)

(assert (=> d!86296 m!386659))

(declare-fun m!386661 () Bool)

(assert (=> d!86296 m!386661))

(declare-fun m!386665 () Bool)

(assert (=> d!86296 m!386665))

(declare-fun m!386669 () Bool)

(assert (=> d!86296 m!386669))

(declare-fun m!386671 () Bool)

(assert (=> b!257086 m!386671))

(declare-fun m!386673 () Bool)

(assert (=> b!257086 m!386673))

(assert (=> b!257086 m!386661))

(assert (=> b!257086 m!386659))

(assert (=> b!257086 m!386665))

(assert (=> b!257074 d!86296))

(declare-fun d!86304 () Bool)

(assert (=> d!86304 (= (array_inv!5858 (buf!6639 thiss!1754)) (bvsge (size!6117 (buf!6639 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257073 d!86304))

(declare-fun d!86308 () Bool)

(assert (=> d!86308 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12164 thiss!1754) (currentByte!12169 thiss!1754) (size!6117 (buf!6639 thiss!1754))))))

(declare-fun bs!21829 () Bool)

(assert (= bs!21829 d!86308))

(declare-fun m!386677 () Bool)

(assert (=> bs!21829 m!386677))

(assert (=> start!55064 d!86308))

(declare-fun d!86310 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6117 (buf!6639 thiss!1754))) ((_ sign_extend 32) (currentByte!12169 thiss!1754)) ((_ sign_extend 32) (currentBit!12164 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6117 (buf!6639 thiss!1754))) ((_ sign_extend 32) (currentByte!12169 thiss!1754)) ((_ sign_extend 32) (currentBit!12164 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21830 () Bool)

(assert (= bs!21830 d!86310))

(declare-fun m!386679 () Bool)

(assert (=> bs!21830 m!386679))

(assert (=> b!257077 d!86310))

(declare-fun d!86312 () Bool)

(assert (=> d!86312 (= (invariant!0 (currentBit!12164 (_2!11925 lt!398357)) (currentByte!12169 (_2!11925 lt!398357)) (size!6117 (buf!6639 (_2!11925 lt!398357)))) (and (bvsge (currentBit!12164 (_2!11925 lt!398357)) #b00000000000000000000000000000000) (bvslt (currentBit!12164 (_2!11925 lt!398357)) #b00000000000000000000000000001000) (bvsge (currentByte!12169 (_2!11925 lt!398357)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12169 (_2!11925 lt!398357)) (size!6117 (buf!6639 (_2!11925 lt!398357)))) (and (= (currentBit!12164 (_2!11925 lt!398357)) #b00000000000000000000000000000000) (= (currentByte!12169 (_2!11925 lt!398357)) (size!6117 (buf!6639 (_2!11925 lt!398357))))))))))

(assert (=> b!257076 d!86312))

(push 1)

(assert (not d!86310))

(assert (not d!86308))

(assert (not b!257086))

(assert (not d!86296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86330 () Bool)

(assert (=> d!86330 (= (remainingBits!0 ((_ sign_extend 32) (size!6117 (buf!6639 thiss!1754))) ((_ sign_extend 32) (currentByte!12169 thiss!1754)) ((_ sign_extend 32) (currentBit!12164 thiss!1754))) (bvsub (bvmul ((_ sign_extend 32) (size!6117 (buf!6639 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12169 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12164 thiss!1754)))))))

(assert (=> d!86310 d!86330))

(declare-fun d!86332 () Bool)

(assert (=> d!86332 (= (invariant!0 (currentBit!12164 thiss!1754) (currentByte!12169 thiss!1754) (size!6117 (buf!6639 thiss!1754))) (and (bvsge (currentBit!12164 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12164 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12169 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12169 thiss!1754) (size!6117 (buf!6639 thiss!1754))) (and (= (currentBit!12164 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12169 thiss!1754) (size!6117 (buf!6639 thiss!1754)))))))))

(assert (=> d!86308 d!86332))

(declare-fun d!86334 () Bool)

(declare-fun e!178260 () Bool)

(assert (=> d!86334 e!178260))

(declare-fun res!215494 () Bool)

(assert (=> d!86334 (=> (not res!215494) (not e!178260))))

(declare-fun lt!398513 () (_ BitVec 64))

(declare-fun lt!398516 () (_ BitVec 64))

(declare-fun lt!398515 () (_ BitVec 64))

(assert (=> d!86334 (= res!215494 (= lt!398515 (bvsub lt!398513 lt!398516)))))

(assert (=> d!86334 (or (= (bvand lt!398513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398513 lt!398516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86334 (= lt!398516 (remainingBits!0 ((_ sign_extend 32) (size!6117 (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754))))) ((_ sign_extend 32) (currentByte!12169 (_2!11928 (increaseBitIndex!0 thiss!1754)))) ((_ sign_extend 32) (currentBit!12164 (_2!11928 (increaseBitIndex!0 thiss!1754))))))))

(declare-fun lt!398511 () (_ BitVec 64))

(declare-fun lt!398514 () (_ BitVec 64))

(assert (=> d!86334 (= lt!398513 (bvmul lt!398511 lt!398514))))

(assert (=> d!86334 (or (= lt!398511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398514 (bvsdiv (bvmul lt!398511 lt!398514) lt!398511)))))

(assert (=> d!86334 (= lt!398514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86334 (= lt!398511 ((_ sign_extend 32) (size!6117 (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86334 (= lt!398515 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12169 (_2!11928 (increaseBitIndex!0 thiss!1754)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12164 (_2!11928 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86334 (invariant!0 (currentBit!12164 (_2!11928 (increaseBitIndex!0 thiss!1754))) (currentByte!12169 (_2!11928 (increaseBitIndex!0 thiss!1754))) (size!6117 (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754)))))))

(assert (=> d!86334 (= (bitIndex!0 (size!6117 (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754)))) (currentByte!12169 (_2!11928 (increaseBitIndex!0 thiss!1754))) (currentBit!12164 (_2!11928 (increaseBitIndex!0 thiss!1754)))) lt!398515)))

(declare-fun b!257119 () Bool)

(declare-fun res!215495 () Bool)

(assert (=> b!257119 (=> (not res!215495) (not e!178260))))

(assert (=> b!257119 (= res!215495 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398515))))

(declare-fun b!257120 () Bool)

(declare-fun lt!398512 () (_ BitVec 64))

(assert (=> b!257120 (= e!178260 (bvsle lt!398515 (bvmul lt!398512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257120 (or (= lt!398512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398512)))))

(assert (=> b!257120 (= lt!398512 ((_ sign_extend 32) (size!6117 (buf!6639 (_2!11928 (increaseBitIndex!0 thiss!1754))))))))

(assert (= (and d!86334 res!215494) b!257119))

(assert (= (and b!257119 res!215495) b!257120))

(declare-fun m!386697 () Bool)

(assert (=> d!86334 m!386697))

(declare-fun m!386699 () Bool)

(assert (=> d!86334 m!386699))

(assert (=> b!257086 d!86334))

(declare-fun d!86344 () Bool)

(declare-fun e!178263 () Bool)

(assert (=> d!86344 e!178263))

(declare-fun res!215501 () Bool)

(assert (=> d!86344 (=> (not res!215501) (not e!178263))))

(declare-fun lt!398528 () tuple2!21984)

(declare-fun lt!398531 () (_ BitVec 64))

(declare-fun lt!398527 () (_ BitVec 64))

(assert (=> d!86344 (= res!215501 (= (bvadd lt!398531 lt!398527) (bitIndex!0 (size!6117 (buf!6639 (_2!11928 lt!398528))) (currentByte!12169 (_2!11928 lt!398528)) (currentBit!12164 (_2!11928 lt!398528)))))))

(assert (=> d!86344 (or (not (= (bvand lt!398531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398527 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398531 lt!398527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86344 (= lt!398527 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!86344 (= lt!398531 (bitIndex!0 (size!6117 (buf!6639 thiss!1754)) (currentByte!12169 thiss!1754) (currentBit!12164 thiss!1754)))))

(declare-fun Unit!18379 () Unit!18373)

(declare-fun Unit!18380 () Unit!18373)

