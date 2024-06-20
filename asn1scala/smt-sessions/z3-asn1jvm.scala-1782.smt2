; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48680 () Bool)

(assert start!48680)

(declare-fun b!230526 () Bool)

(declare-fun res!193221 () Bool)

(declare-fun e!158334 () Bool)

(assert (=> b!230526 (=> (not res!193221) (not e!158334))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368139 () (_ BitVec 64))

(declare-datatypes ((array!11758 0))(
  ( (array!11759 (arr!6140 (Array (_ BitVec 32) (_ BitVec 8))) (size!5153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9402 0))(
  ( (BitStream!9403 (buf!5694 array!11758) (currentByte!10672 (_ BitVec 32)) (currentBit!10667 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9402)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230526 (= res!193221 (= lt!368139 (bvadd (bitIndex!0 (size!5153 (buf!5694 b1!101)) (currentByte!10672 b1!101) (currentBit!10667 b1!101)) bits!86)))))

(declare-fun b!230527 () Bool)

(declare-fun e!158338 () Bool)

(declare-fun b2!99 () BitStream!9402)

(declare-fun array_inv!4894 (array!11758) Bool)

(assert (=> b!230527 (= e!158338 (array_inv!4894 (buf!5694 b2!99)))))

(declare-fun b!230528 () Bool)

(declare-fun e!158335 () Bool)

(assert (=> b!230528 (= e!158335 (array_inv!4894 (buf!5694 b1!101)))))

(declare-fun b!230529 () Bool)

(declare-fun e!158337 () Bool)

(assert (=> b!230529 (= e!158337 e!158334)))

(declare-fun res!193222 () Bool)

(assert (=> b!230529 (=> (not res!193222) (not e!158334))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!230529 (= res!193222 (and (bvsle bits!86 lt!368139) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230529 (= lt!368139 (bitIndex!0 (size!5153 (buf!5694 b2!99)) (currentByte!10672 b2!99) (currentBit!10667 b2!99)))))

(declare-fun res!193220 () Bool)

(assert (=> start!48680 (=> (not res!193220) (not e!158337))))

(assert (=> start!48680 (= res!193220 (and (= (size!5153 (buf!5694 b1!101)) (size!5153 (buf!5694 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48680 e!158337))

(declare-fun inv!12 (BitStream!9402) Bool)

(assert (=> start!48680 (and (inv!12 b1!101) e!158335)))

(assert (=> start!48680 (and (inv!12 b2!99) e!158338)))

(assert (=> start!48680 true))

(declare-fun b!230530 () Bool)

(assert (=> b!230530 (= e!158334 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5153 (buf!5694 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10672 b1!101))) ((_ sign_extend 32) (currentBit!10667 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= lt!368139 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10672 b2!99))) ((_ sign_extend 32) (currentBit!10667 b2!99)))))))))

(declare-fun b!230531 () Bool)

(declare-fun res!193219 () Bool)

(assert (=> b!230531 (=> (not res!193219) (not e!158334))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230531 (= res!193219 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5153 (buf!5694 b1!101))) ((_ sign_extend 32) (currentByte!10672 b1!101)) ((_ sign_extend 32) (currentBit!10667 b1!101)) bytes!19))))

(declare-fun b!230532 () Bool)

(declare-fun res!193218 () Bool)

(assert (=> b!230532 (=> (not res!193218) (not e!158334))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230532 (= res!193218 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5153 (buf!5694 b1!101))) ((_ sign_extend 32) (currentByte!10672 b1!101)) ((_ sign_extend 32) (currentBit!10667 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48680 res!193220) b!230529))

(assert (= (and b!230529 res!193222) b!230531))

(assert (= (and b!230531 res!193219) b!230526))

(assert (= (and b!230526 res!193221) b!230532))

(assert (= (and b!230532 res!193218) b!230530))

(assert (= start!48680 b!230528))

(assert (= start!48680 b!230527))

(declare-fun m!353825 () Bool)

(assert (=> b!230528 m!353825))

(declare-fun m!353827 () Bool)

(assert (=> b!230532 m!353827))

(declare-fun m!353829 () Bool)

(assert (=> b!230529 m!353829))

(declare-fun m!353831 () Bool)

(assert (=> b!230526 m!353831))

(declare-fun m!353833 () Bool)

(assert (=> start!48680 m!353833))

(declare-fun m!353835 () Bool)

(assert (=> start!48680 m!353835))

(declare-fun m!353837 () Bool)

(assert (=> b!230527 m!353837))

(declare-fun m!353839 () Bool)

(assert (=> b!230531 m!353839))

(check-sat (not b!230528) (not start!48680) (not b!230531) (not b!230527) (not b!230532) (not b!230529) (not b!230526))
(check-sat)
