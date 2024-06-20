; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55136 () Bool)

(assert start!55136)

(declare-fun b!257259 () Bool)

(declare-fun res!215610 () Bool)

(declare-fun e!178371 () Bool)

(assert (=> b!257259 (=> (not res!215610) (not e!178371))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257259 (= res!215610 (not (= from!526 nBits!535)))))

(declare-fun b!257261 () Bool)

(declare-fun e!178372 () Bool)

(declare-datatypes ((array!13972 0))(
  ( (array!13973 (arr!7113 (Array (_ BitVec 32) (_ BitVec 8))) (size!6126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11174 0))(
  ( (BitStream!11175 (buf!6648 array!13972) (currentByte!12193 (_ BitVec 32)) (currentBit!12188 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11174)

(declare-fun array_inv!5867 (array!13972) Bool)

(assert (=> b!257261 (= e!178372 (array_inv!5867 (buf!6648 thiss!1754)))))

(declare-fun b!257260 () Bool)

(declare-fun e!178370 () Bool)

(assert (=> b!257260 (= e!178371 e!178370)))

(declare-fun res!215611 () Bool)

(assert (=> b!257260 (=> (not res!215611) (not e!178370))))

(declare-datatypes ((tuple2!22002 0))(
  ( (tuple2!22003 (_1!11937 Bool) (_2!11937 BitStream!11174)) )
))
(declare-fun lt!398616 () tuple2!22002)

(declare-fun expected!109 () Bool)

(assert (=> b!257260 (= res!215611 (not (= (_1!11937 lt!398616) expected!109)))))

(declare-fun readBit!0 (BitStream!11174) tuple2!22002)

(assert (=> b!257260 (= lt!398616 (readBit!0 thiss!1754))))

(declare-fun res!215608 () Bool)

(assert (=> start!55136 (=> (not res!215608) (not e!178371))))

(assert (=> start!55136 (= res!215608 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55136 e!178371))

(assert (=> start!55136 true))

(declare-fun inv!12 (BitStream!11174) Bool)

(assert (=> start!55136 (and (inv!12 thiss!1754) e!178372)))

(declare-fun b!257262 () Bool)

(assert (=> b!257262 (= e!178370 false)))

(declare-fun lt!398618 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257262 (= lt!398618 (bitIndex!0 (size!6126 (buf!6648 (_2!11937 lt!398616))) (currentByte!12193 (_2!11937 lt!398616)) (currentBit!12188 (_2!11937 lt!398616))))))

(declare-fun lt!398617 () (_ BitVec 64))

(assert (=> b!257262 (= lt!398617 (bitIndex!0 (size!6126 (buf!6648 thiss!1754)) (currentByte!12193 thiss!1754) (currentBit!12188 thiss!1754)))))

(declare-fun b!257263 () Bool)

(declare-fun res!215609 () Bool)

(assert (=> b!257263 (=> (not res!215609) (not e!178371))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257263 (= res!215609 (validate_offset_bits!1 ((_ sign_extend 32) (size!6126 (buf!6648 thiss!1754))) ((_ sign_extend 32) (currentByte!12193 thiss!1754)) ((_ sign_extend 32) (currentBit!12188 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55136 res!215608) b!257263))

(assert (= (and b!257263 res!215609) b!257259))

(assert (= (and b!257259 res!215610) b!257260))

(assert (= (and b!257260 res!215611) b!257262))

(assert (= start!55136 b!257261))

(declare-fun m!386801 () Bool)

(assert (=> b!257261 m!386801))

(declare-fun m!386803 () Bool)

(assert (=> start!55136 m!386803))

(declare-fun m!386805 () Bool)

(assert (=> b!257263 m!386805))

(declare-fun m!386807 () Bool)

(assert (=> b!257260 m!386807))

(declare-fun m!386809 () Bool)

(assert (=> b!257262 m!386809))

(declare-fun m!386811 () Bool)

(assert (=> b!257262 m!386811))

(push 1)

(assert (not start!55136))

(assert (not b!257263))

(assert (not b!257261))

(assert (not b!257260))

(assert (not b!257262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

