; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48682 () Bool)

(assert start!48682)

(declare-fun b!230547 () Bool)

(declare-fun res!193237 () Bool)

(declare-fun e!158351 () Bool)

(assert (=> b!230547 (=> (not res!193237) (not e!158351))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11760 0))(
  ( (array!11761 (arr!6141 (Array (_ BitVec 32) (_ BitVec 8))) (size!5154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9404 0))(
  ( (BitStream!9405 (buf!5695 array!11760) (currentByte!10673 (_ BitVec 32)) (currentBit!10668 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9404)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230547 (= res!193237 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5154 (buf!5695 b1!101))) ((_ sign_extend 32) (currentByte!10673 b1!101)) ((_ sign_extend 32) (currentBit!10668 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230548 () Bool)

(declare-fun res!193236 () Bool)

(assert (=> b!230548 (=> (not res!193236) (not e!158351))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368142 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230548 (= res!193236 (= lt!368142 (bvadd (bitIndex!0 (size!5154 (buf!5695 b1!101)) (currentByte!10673 b1!101) (currentBit!10668 b1!101)) bits!86)))))

(declare-fun b!230549 () Bool)

(declare-fun e!158355 () Bool)

(declare-fun array_inv!4895 (array!11760) Bool)

(assert (=> b!230549 (= e!158355 (array_inv!4895 (buf!5695 b1!101)))))

(declare-fun b!230550 () Bool)

(declare-fun e!158354 () Bool)

(declare-fun b2!99 () BitStream!9404)

(assert (=> b!230550 (= e!158354 (array_inv!4895 (buf!5695 b2!99)))))

(declare-fun b!230551 () Bool)

(declare-fun res!193233 () Bool)

(assert (=> b!230551 (=> (not res!193233) (not e!158351))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230551 (= res!193233 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5154 (buf!5695 b1!101))) ((_ sign_extend 32) (currentByte!10673 b1!101)) ((_ sign_extend 32) (currentBit!10668 b1!101)) bytes!19))))

(declare-fun res!193235 () Bool)

(declare-fun e!158352 () Bool)

(assert (=> start!48682 (=> (not res!193235) (not e!158352))))

(assert (=> start!48682 (= res!193235 (and (= (size!5154 (buf!5695 b1!101)) (size!5154 (buf!5695 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48682 e!158352))

(declare-fun inv!12 (BitStream!9404) Bool)

(assert (=> start!48682 (and (inv!12 b1!101) e!158355)))

(assert (=> start!48682 (and (inv!12 b2!99) e!158354)))

(assert (=> start!48682 true))

(declare-fun b!230552 () Bool)

(assert (=> b!230552 (= e!158352 e!158351)))

(declare-fun res!193234 () Bool)

(assert (=> b!230552 (=> (not res!193234) (not e!158351))))

(assert (=> b!230552 (= res!193234 (and (bvsle bits!86 lt!368142) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230552 (= lt!368142 (bitIndex!0 (size!5154 (buf!5695 b2!99)) (currentByte!10673 b2!99) (currentBit!10668 b2!99)))))

(declare-fun b!230553 () Bool)

(assert (=> b!230553 (= e!158351 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5154 (buf!5695 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10673 b1!101))) ((_ sign_extend 32) (currentBit!10668 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= lt!368142 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10673 b2!99))) ((_ sign_extend 32) (currentBit!10668 b2!99)))))))))

(assert (= (and start!48682 res!193235) b!230552))

(assert (= (and b!230552 res!193234) b!230551))

(assert (= (and b!230551 res!193233) b!230548))

(assert (= (and b!230548 res!193236) b!230547))

(assert (= (and b!230547 res!193237) b!230553))

(assert (= start!48682 b!230549))

(assert (= start!48682 b!230550))

(declare-fun m!353841 () Bool)

(assert (=> b!230551 m!353841))

(declare-fun m!353843 () Bool)

(assert (=> b!230552 m!353843))

(declare-fun m!353845 () Bool)

(assert (=> b!230550 m!353845))

(declare-fun m!353847 () Bool)

(assert (=> b!230547 m!353847))

(declare-fun m!353849 () Bool)

(assert (=> b!230548 m!353849))

(declare-fun m!353851 () Bool)

(assert (=> b!230549 m!353851))

(declare-fun m!353853 () Bool)

(assert (=> start!48682 m!353853))

(declare-fun m!353855 () Bool)

(assert (=> start!48682 m!353855))

(push 1)

(assert (not b!230547))

(assert (not b!230552))

(assert (not b!230549))

(assert (not b!230548))

(assert (not b!230551))

(assert (not b!230550))

(assert (not start!48682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

