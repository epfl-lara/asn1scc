; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48778 () Bool)

(assert start!48778)

(declare-fun res!193464 () Bool)

(declare-fun e!158643 () Bool)

(assert (=> start!48778 (=> (not res!193464) (not e!158643))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11798 0))(
  ( (array!11799 (arr!6156 (Array (_ BitVec 32) (_ BitVec 8))) (size!5169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9434 0))(
  ( (BitStream!9435 (buf!5710 array!11798) (currentByte!10705 (_ BitVec 32)) (currentBit!10700 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9434)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9434)

(assert (=> start!48778 (= res!193464 (and (= (size!5169 (buf!5710 b1!101)) (size!5169 (buf!5710 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48778 e!158643))

(declare-fun e!158642 () Bool)

(declare-fun inv!12 (BitStream!9434) Bool)

(assert (=> start!48778 (and (inv!12 b1!101) e!158642)))

(declare-fun e!158644 () Bool)

(assert (=> start!48778 (and (inv!12 b2!99) e!158644)))

(assert (=> start!48778 true))

(declare-fun b!230868 () Bool)

(assert (=> b!230868 (= e!158643 false)))

(declare-fun lt!368382 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230868 (= lt!368382 (bitIndex!0 (size!5169 (buf!5710 b2!99)) (currentByte!10705 b2!99) (currentBit!10700 b2!99)))))

(declare-fun b!230869 () Bool)

(declare-fun array_inv!4910 (array!11798) Bool)

(assert (=> b!230869 (= e!158642 (array_inv!4910 (buf!5710 b1!101)))))

(declare-fun b!230870 () Bool)

(assert (=> b!230870 (= e!158644 (array_inv!4910 (buf!5710 b2!99)))))

(assert (= (and start!48778 res!193464) b!230868))

(assert (= start!48778 b!230869))

(assert (= start!48778 b!230870))

(declare-fun m!354097 () Bool)

(assert (=> start!48778 m!354097))

(declare-fun m!354099 () Bool)

(assert (=> start!48778 m!354099))

(declare-fun m!354101 () Bool)

(assert (=> b!230868 m!354101))

(declare-fun m!354103 () Bool)

(assert (=> b!230869 m!354103))

(declare-fun m!354105 () Bool)

(assert (=> b!230870 m!354105))

(push 1)

(assert (not start!48778))

(assert (not b!230870))

