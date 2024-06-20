; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16718 () Bool)

(assert start!16718)

(declare-fun b!82575 () Bool)

(declare-fun e!54613 () Bool)

(declare-fun e!54610 () Bool)

(assert (=> b!82575 (= e!54613 e!54610)))

(declare-fun res!68022 () Bool)

(assert (=> b!82575 (=> (not res!68022) (not e!54610))))

(declare-fun lt!131433 () (_ BitVec 64))

(declare-fun lt!131436 () (_ BitVec 64))

(assert (=> b!82575 (= res!68022 (= lt!131433 lt!131436))))

(declare-datatypes ((array!3734 0))(
  ( (array!3735 (arr!2343 (Array (_ BitVec 32) (_ BitVec 8))) (size!1706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2974 0))(
  ( (BitStream!2975 (buf!2096 array!3734) (currentByte!4122 (_ BitVec 32)) (currentBit!4117 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2974)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82575 (= lt!131436 (bitIndex!0 (size!1706 (buf!2096 b2!98)) (currentByte!4122 b2!98) (currentBit!4117 b2!98)))))

(declare-fun lt!131430 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82575 (= lt!131433 (bvadd lt!131430 b1b2Diff!1))))

(declare-fun b1!98 () BitStream!2974)

(assert (=> b!82575 (= lt!131430 (bitIndex!0 (size!1706 (buf!2096 b1!98)) (currentByte!4122 b1!98) (currentBit!4117 b1!98)))))

(declare-fun b!82576 () Bool)

(declare-fun e!54612 () Bool)

(declare-fun array_inv!1552 (array!3734) Bool)

(assert (=> b!82576 (= e!54612 (array_inv!1552 (buf!2096 b1!98)))))

(declare-fun b!82577 () Bool)

(declare-fun res!68021 () Bool)

(assert (=> b!82577 (=> (not res!68021) (not e!54613))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82577 (= res!68021 (validate_offset_bits!1 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun lt!131429 () (_ BitVec 64))

(declare-fun b!82578 () Bool)

(declare-fun e!54615 () Bool)

(declare-fun lt!131431 () (_ BitVec 64))

(assert (=> b!82578 (= e!54615 (or (not (= lt!131431 (bvsub lt!131429 lt!131433))) (bvsgt ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4122 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4117 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4122 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4117 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!82578 (= lt!131431 (bvsub lt!131429 lt!131436))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82578 (= lt!131431 (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) ((_ sign_extend 32) (currentByte!4122 b2!98)) ((_ sign_extend 32) (currentBit!4117 b2!98))))))

(assert (=> b!82578 (= lt!131429 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98)))))))

(declare-datatypes ((Unit!5521 0))(
  ( (Unit!5522) )
))
(declare-fun lt!131435 () Unit!5521)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2974) Unit!5521)

(assert (=> b!82578 (= lt!131435 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68023 () Bool)

(assert (=> start!16718 (=> (not res!68023) (not e!54613))))

(assert (=> start!16718 (= res!68023 (and (= (size!1706 (buf!2096 b1!98)) (size!1706 (buf!2096 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16718 e!54613))

(declare-fun inv!12 (BitStream!2974) Bool)

(assert (=> start!16718 (and (inv!12 b1!98) e!54612)))

(declare-fun e!54611 () Bool)

(assert (=> start!16718 (and (inv!12 b2!98) e!54611)))

(assert (=> start!16718 true))

(declare-fun b!82579 () Bool)

(assert (=> b!82579 (= e!54611 (array_inv!1552 (buf!2096 b2!98)))))

(declare-fun b!82580 () Bool)

(assert (=> b!82580 (= e!54610 (not e!54615))))

(declare-fun res!68020 () Bool)

(assert (=> b!82580 (=> res!68020 e!54615)))

(declare-fun lt!131432 () (_ BitVec 64))

(assert (=> b!82580 (= res!68020 (bvsgt lt!131430 (bvsub lt!131432 b1ValidateOffsetBits!11)))))

(assert (=> b!82580 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98))) (bvsub lt!131432 lt!131430))))

(assert (=> b!82580 (= lt!131432 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98)))))))

(declare-fun lt!131434 () Unit!5521)

(assert (=> b!82580 (= lt!131434 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16718 res!68023) b!82577))

(assert (= (and b!82577 res!68021) b!82575))

(assert (= (and b!82575 res!68022) b!82580))

(assert (= (and b!82580 (not res!68020)) b!82578))

(assert (= start!16718 b!82576))

(assert (= start!16718 b!82579))

(declare-fun m!129051 () Bool)

(assert (=> b!82576 m!129051))

(declare-fun m!129053 () Bool)

(assert (=> start!16718 m!129053))

(declare-fun m!129055 () Bool)

(assert (=> start!16718 m!129055))

(declare-fun m!129057 () Bool)

(assert (=> b!82575 m!129057))

(declare-fun m!129059 () Bool)

(assert (=> b!82575 m!129059))

(declare-fun m!129061 () Bool)

(assert (=> b!82580 m!129061))

(declare-fun m!129063 () Bool)

(assert (=> b!82580 m!129063))

(declare-fun m!129065 () Bool)

(assert (=> b!82577 m!129065))

(declare-fun m!129067 () Bool)

(assert (=> b!82579 m!129067))

(declare-fun m!129069 () Bool)

(assert (=> b!82578 m!129069))

(declare-fun m!129071 () Bool)

(assert (=> b!82578 m!129071))

(push 1)

(assert (not start!16718))

(assert (not b!82576))

(assert (not b!82577))

(assert (not b!82579))

(assert (not b!82575))

(assert (not b!82578))

(assert (not b!82580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26186 () Bool)

(assert (=> d!26186 (= (array_inv!1552 (buf!2096 b1!98)) (bvsge (size!1706 (buf!2096 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82576 d!26186))

(declare-fun d!26188 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26188 (= (inv!12 b1!98) (invariant!0 (currentBit!4117 b1!98) (currentByte!4122 b1!98) (size!1706 (buf!2096 b1!98))))))

(declare-fun bs!6422 () Bool)

(assert (= bs!6422 d!26188))

(declare-fun m!129125 () Bool)

(assert (=> bs!6422 m!129125))

(assert (=> start!16718 d!26188))

(declare-fun d!26190 () Bool)

(assert (=> d!26190 (= (inv!12 b2!98) (invariant!0 (currentBit!4117 b2!98) (currentByte!4122 b2!98) (size!1706 (buf!2096 b2!98))))))

(declare-fun bs!6423 () Bool)

(assert (= bs!6423 d!26190))

(declare-fun m!129127 () Bool)

(assert (=> bs!6423 m!129127))

(assert (=> start!16718 d!26190))

(declare-fun d!26192 () Bool)

(declare-fun e!54664 () Bool)

(assert (=> d!26192 e!54664))

(declare-fun res!68061 () Bool)

(assert (=> d!26192 (=> (not res!68061) (not e!54664))))

(declare-fun lt!131546 () (_ BitVec 64))

(declare-fun lt!131542 () (_ BitVec 64))

(declare-fun lt!131544 () (_ BitVec 64))

(assert (=> d!26192 (= res!68061 (= lt!131544 (bvsub lt!131542 lt!131546)))))

(assert (=> d!26192 (or (= (bvand lt!131542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131542 lt!131546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26192 (= lt!131546 (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) ((_ sign_extend 32) (currentByte!4122 b2!98)) ((_ sign_extend 32) (currentBit!4117 b2!98))))))

(declare-fun lt!131545 () (_ BitVec 64))

(declare-fun lt!131543 () (_ BitVec 64))

(assert (=> d!26192 (= lt!131542 (bvmul lt!131545 lt!131543))))

(assert (=> d!26192 (or (= lt!131545 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131543 (bvsdiv (bvmul lt!131545 lt!131543) lt!131545)))))

(assert (=> d!26192 (= lt!131543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26192 (= lt!131545 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))))))

(assert (=> d!26192 (= lt!131544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4122 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4117 b2!98))))))

(assert (=> d!26192 (invariant!0 (currentBit!4117 b2!98) (currentByte!4122 b2!98) (size!1706 (buf!2096 b2!98)))))

(assert (=> d!26192 (= (bitIndex!0 (size!1706 (buf!2096 b2!98)) (currentByte!4122 b2!98) (currentBit!4117 b2!98)) lt!131544)))

(declare-fun b!82630 () Bool)

(declare-fun res!68060 () Bool)

(assert (=> b!82630 (=> (not res!68060) (not e!54664))))

(assert (=> b!82630 (= res!68060 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131544))))

(declare-fun b!82631 () Bool)

(declare-fun lt!131541 () (_ BitVec 64))

(assert (=> b!82631 (= e!54664 (bvsle lt!131544 (bvmul lt!131541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82631 (or (= lt!131541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131541)))))

(assert (=> b!82631 (= lt!131541 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))))))

(assert (= (and d!26192 res!68061) b!82630))

(assert (= (and b!82630 res!68060) b!82631))

(assert (=> d!26192 m!129069))

(assert (=> d!26192 m!129127))

(assert (=> b!82575 d!26192))

(declare-fun d!26196 () Bool)

(declare-fun e!54665 () Bool)

(assert (=> d!26196 e!54665))

(declare-fun res!68063 () Bool)

(assert (=> d!26196 (=> (not res!68063) (not e!54665))))

(declare-fun lt!131550 () (_ BitVec 64))

(declare-fun lt!131548 () (_ BitVec 64))

(declare-fun lt!131552 () (_ BitVec 64))

(assert (=> d!26196 (= res!68063 (= lt!131550 (bvsub lt!131548 lt!131552)))))

(assert (=> d!26196 (or (= (bvand lt!131548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131552 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131548 lt!131552) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26196 (= lt!131552 (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98))))))

(declare-fun lt!131551 () (_ BitVec 64))

(declare-fun lt!131549 () (_ BitVec 64))

(assert (=> d!26196 (= lt!131548 (bvmul lt!131551 lt!131549))))

(assert (=> d!26196 (or (= lt!131551 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131549 (bvsdiv (bvmul lt!131551 lt!131549) lt!131551)))))

(assert (=> d!26196 (= lt!131549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26196 (= lt!131551 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))))))

(assert (=> d!26196 (= lt!131550 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4122 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4117 b1!98))))))

(assert (=> d!26196 (invariant!0 (currentBit!4117 b1!98) (currentByte!4122 b1!98) (size!1706 (buf!2096 b1!98)))))

(assert (=> d!26196 (= (bitIndex!0 (size!1706 (buf!2096 b1!98)) (currentByte!4122 b1!98) (currentBit!4117 b1!98)) lt!131550)))

(declare-fun b!82632 () Bool)

(declare-fun res!68062 () Bool)

(assert (=> b!82632 (=> (not res!68062) (not e!54665))))

(assert (=> b!82632 (= res!68062 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131550))))

(declare-fun b!82633 () Bool)

(declare-fun lt!131547 () (_ BitVec 64))

(assert (=> b!82633 (= e!54665 (bvsle lt!131550 (bvmul lt!131547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82633 (or (= lt!131547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131547)))))

(assert (=> b!82633 (= lt!131547 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))))))

(assert (= (and d!26196 res!68063) b!82632))

(assert (= (and b!82632 res!68062) b!82633))

(assert (=> d!26196 m!129061))

(assert (=> d!26196 m!129125))

(assert (=> b!82575 d!26196))

(declare-fun d!26198 () Bool)

(assert (=> d!26198 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4122 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4117 b1!98)))))))

(assert (=> b!82580 d!26198))

(declare-fun d!26200 () Bool)

(declare-fun lt!131572 () (_ BitVec 64))

(declare-fun lt!131575 () (_ BitVec 64))

(assert (=> d!26200 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98))) (bvsub lt!131572 lt!131575))))

(assert (=> d!26200 (or (= (bvand lt!131572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131575 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131572 lt!131575) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26200 (= lt!131575 (bitIndex!0 (size!1706 (buf!2096 b1!98)) (currentByte!4122 b1!98) (currentBit!4117 b1!98)))))

(declare-fun lt!131571 () (_ BitVec 64))

(declare-fun lt!131574 () (_ BitVec 64))

(assert (=> d!26200 (= lt!131572 (bvmul lt!131571 lt!131574))))

(assert (=> d!26200 (or (= lt!131571 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131574 (bvsdiv (bvmul lt!131571 lt!131574) lt!131571)))))

(assert (=> d!26200 (= lt!131574 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26200 (= lt!131571 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))))))

(declare-fun lt!131573 () Unit!5521)

(declare-fun choose!23 (BitStream!2974) Unit!5521)

(assert (=> d!26200 (= lt!131573 (choose!23 b1!98))))

(assert (=> d!26200 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131573)))

(declare-fun bs!6424 () Bool)

(assert (= bs!6424 d!26200))

(assert (=> bs!6424 m!129061))

(assert (=> bs!6424 m!129059))

(declare-fun m!129129 () Bool)

(assert (=> bs!6424 m!129129))

(assert (=> b!82580 d!26200))

(declare-fun d!26202 () Bool)

(assert (=> d!26202 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) ((_ sign_extend 32) (currentByte!4122 b2!98)) ((_ sign_extend 32) (currentBit!4117 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4122 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4117 b2!98)))))))

(assert (=> b!82578 d!26202))

(declare-fun d!26204 () Bool)

(declare-fun lt!131581 () (_ BitVec 64))

(declare-fun lt!131584 () (_ BitVec 64))

(assert (=> d!26204 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) ((_ sign_extend 32) (currentByte!4122 b2!98)) ((_ sign_extend 32) (currentBit!4117 b2!98))) (bvsub lt!131581 lt!131584))))

(assert (=> d!26204 (or (= (bvand lt!131581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131581 lt!131584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26204 (= lt!131584 (bitIndex!0 (size!1706 (buf!2096 b2!98)) (currentByte!4122 b2!98) (currentBit!4117 b2!98)))))

(declare-fun lt!131580 () (_ BitVec 64))

(declare-fun lt!131583 () (_ BitVec 64))

(assert (=> d!26204 (= lt!131581 (bvmul lt!131580 lt!131583))))

(assert (=> d!26204 (or (= lt!131580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131583 (bvsdiv (bvmul lt!131580 lt!131583) lt!131580)))))

(assert (=> d!26204 (= lt!131583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26204 (= lt!131580 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))))))

(declare-fun lt!131582 () Unit!5521)

(assert (=> d!26204 (= lt!131582 (choose!23 b2!98))))

(assert (=> d!26204 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131582)))

(declare-fun bs!6425 () Bool)

(assert (= bs!6425 d!26204))

(assert (=> bs!6425 m!129069))

(assert (=> bs!6425 m!129057))

(declare-fun m!129131 () Bool)

(assert (=> bs!6425 m!129131))

(assert (=> b!82578 d!26204))

(declare-fun d!26206 () Bool)

(assert (=> d!26206 (= (array_inv!1552 (buf!2096 b2!98)) (bvsge (size!1706 (buf!2096 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82579 d!26206))

(declare-fun d!26208 () Bool)

(assert (=> d!26208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6426 () Bool)

(assert (= bs!6426 d!26208))

(assert (=> bs!6426 m!129061))

(assert (=> b!82577 d!26208))

(push 1)

(assert (not d!26204))

(assert (not d!26200))

(assert (not d!26192))

(assert (not d!26196))

(assert (not d!26188))

(assert (not d!26190))

(assert (not d!26208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!26196 d!26198))

(declare-fun d!26230 () Bool)

(assert (=> d!26230 (= (invariant!0 (currentBit!4117 b1!98) (currentByte!4122 b1!98) (size!1706 (buf!2096 b1!98))) (and (bvsge (currentBit!4117 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4117 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4122 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4122 b1!98) (size!1706 (buf!2096 b1!98))) (and (= (currentBit!4117 b1!98) #b00000000000000000000000000000000) (= (currentByte!4122 b1!98) (size!1706 (buf!2096 b1!98)))))))))

(assert (=> d!26196 d!26230))

(declare-fun d!26232 () Bool)

(assert (=> d!26232 (= (invariant!0 (currentBit!4117 b2!98) (currentByte!4122 b2!98) (size!1706 (buf!2096 b2!98))) (and (bvsge (currentBit!4117 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!4117 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!4122 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4122 b2!98) (size!1706 (buf!2096 b2!98))) (and (= (currentBit!4117 b2!98) #b00000000000000000000000000000000) (= (currentByte!4122 b2!98) (size!1706 (buf!2096 b2!98)))))))))

(assert (=> d!26190 d!26232))

(assert (=> d!26192 d!26202))

(assert (=> d!26192 d!26232))

(assert (=> d!26200 d!26198))

(assert (=> d!26200 d!26196))

(declare-fun d!26234 () Bool)

(assert (=> d!26234 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) ((_ sign_extend 32) (currentByte!4122 b1!98)) ((_ sign_extend 32) (currentBit!4117 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1706 (buf!2096 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1706 (buf!2096 b1!98)) (currentByte!4122 b1!98) (currentBit!4117 b1!98))))))

(assert (=> d!26234 true))

(declare-fun _$4!34 () Unit!5521)

(assert (=> d!26234 (= (choose!23 b1!98) _$4!34)))

(declare-fun bs!6432 () Bool)

(assert (= bs!6432 d!26234))

(assert (=> bs!6432 m!129061))

(assert (=> bs!6432 m!129059))

(assert (=> d!26200 d!26234))

(assert (=> d!26208 d!26198))

(assert (=> d!26204 d!26202))

(assert (=> d!26204 d!26192))

(declare-fun d!26236 () Bool)

(assert (=> d!26236 (= (remainingBits!0 ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) ((_ sign_extend 32) (currentByte!4122 b2!98)) ((_ sign_extend 32) (currentBit!4117 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1706 (buf!2096 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1706 (buf!2096 b2!98)) (currentByte!4122 b2!98) (currentBit!4117 b2!98))))))

(assert (=> d!26236 true))

(declare-fun _$4!35 () Unit!5521)

(assert (=> d!26236 (= (choose!23 b2!98) _$4!35)))

(declare-fun bs!6433 () Bool)

(assert (= bs!6433 d!26236))

(assert (=> bs!6433 m!129069))

(assert (=> bs!6433 m!129057))

(assert (=> d!26204 d!26236))

(assert (=> d!26188 d!26230))

(push 1)

(assert (not d!26234))

(assert (not d!26236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

