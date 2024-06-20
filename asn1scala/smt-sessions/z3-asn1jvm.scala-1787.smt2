; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48776 () Bool)

(assert start!48776)

(declare-fun res!193461 () Bool)

(declare-fun e!158626 () Bool)

(assert (=> start!48776 (=> (not res!193461) (not e!158626))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11796 0))(
  ( (array!11797 (arr!6155 (Array (_ BitVec 32) (_ BitVec 8))) (size!5168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9432 0))(
  ( (BitStream!9433 (buf!5709 array!11796) (currentByte!10704 (_ BitVec 32)) (currentBit!10699 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9432)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9432)

(assert (=> start!48776 (= res!193461 (and (= (size!5168 (buf!5709 b1!101)) (size!5168 (buf!5709 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48776 e!158626))

(declare-fun e!158628 () Bool)

(declare-fun inv!12 (BitStream!9432) Bool)

(assert (=> start!48776 (and (inv!12 b1!101) e!158628)))

(declare-fun e!158630 () Bool)

(assert (=> start!48776 (and (inv!12 b2!99) e!158630)))

(assert (=> start!48776 true))

(declare-fun b!230859 () Bool)

(assert (=> b!230859 (= e!158626 false)))

(declare-fun lt!368379 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230859 (= lt!368379 (bitIndex!0 (size!5168 (buf!5709 b2!99)) (currentByte!10704 b2!99) (currentBit!10699 b2!99)))))

(declare-fun b!230860 () Bool)

(declare-fun array_inv!4909 (array!11796) Bool)

(assert (=> b!230860 (= e!158628 (array_inv!4909 (buf!5709 b1!101)))))

(declare-fun b!230861 () Bool)

(assert (=> b!230861 (= e!158630 (array_inv!4909 (buf!5709 b2!99)))))

(assert (= (and start!48776 res!193461) b!230859))

(assert (= start!48776 b!230860))

(assert (= start!48776 b!230861))

(declare-fun m!354087 () Bool)

(assert (=> start!48776 m!354087))

(declare-fun m!354089 () Bool)

(assert (=> start!48776 m!354089))

(declare-fun m!354091 () Bool)

(assert (=> b!230859 m!354091))

(declare-fun m!354093 () Bool)

(assert (=> b!230860 m!354093))

(declare-fun m!354095 () Bool)

(assert (=> b!230861 m!354095))

(check-sat (not b!230861) (not b!230859) (not b!230860) (not start!48776))
