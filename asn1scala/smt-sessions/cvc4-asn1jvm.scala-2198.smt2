; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55742 () Bool)

(assert start!55742)

(declare-fun b!259197 () Bool)

(declare-fun res!217132 () Bool)

(declare-fun e!179813 () Bool)

(assert (=> b!259197 (=> (not res!217132) (not e!179813))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259197 (= res!217132 (not (= from!526 nBits!535)))))

(declare-fun b!259198 () Bool)

(declare-fun e!179814 () Bool)

(declare-datatypes ((array!14158 0))(
  ( (array!14159 (arr!7188 (Array (_ BitVec 32) (_ BitVec 8))) (size!6201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11324 0))(
  ( (BitStream!11325 (buf!6723 array!14158) (currentByte!12358 (_ BitVec 32)) (currentBit!12353 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11324)

(declare-fun array_inv!5942 (array!14158) Bool)

(assert (=> b!259198 (= e!179814 (array_inv!5942 (buf!6723 thiss!1754)))))

(declare-fun b!259199 () Bool)

(declare-fun res!217131 () Bool)

(assert (=> b!259199 (=> (not res!217131) (not e!179813))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259199 (= res!217131 (validate_offset_bits!1 ((_ sign_extend 32) (size!6201 (buf!6723 thiss!1754))) ((_ sign_extend 32) (currentByte!12358 thiss!1754)) ((_ sign_extend 32) (currentBit!12353 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259200 () Bool)

(assert (=> b!259200 (= e!179813 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(declare-fun res!217129 () Bool)

(assert (=> start!55742 (=> (not res!217129) (not e!179813))))

(assert (=> start!55742 (= res!217129 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55742 e!179813))

(assert (=> start!55742 true))

(declare-fun inv!12 (BitStream!11324) Bool)

(assert (=> start!55742 (and (inv!12 thiss!1754) e!179814)))

(declare-fun b!259201 () Bool)

(declare-fun res!217130 () Bool)

(assert (=> b!259201 (=> (not res!217130) (not e!179813))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22194 0))(
  ( (tuple2!22195 (_1!12033 Bool) (_2!12033 BitStream!11324)) )
))
(declare-fun readBit!0 (BitStream!11324) tuple2!22194)

(assert (=> b!259201 (= res!217130 (= (_1!12033 (readBit!0 thiss!1754)) expected!109))))

(assert (= (and start!55742 res!217129) b!259199))

(assert (= (and b!259199 res!217131) b!259197))

(assert (= (and b!259197 res!217132) b!259201))

(assert (= (and b!259201 res!217130) b!259200))

(assert (= start!55742 b!259198))

(declare-fun m!388509 () Bool)

(assert (=> b!259198 m!388509))

(declare-fun m!388511 () Bool)

(assert (=> b!259199 m!388511))

(declare-fun m!388513 () Bool)

(assert (=> start!55742 m!388513))

(declare-fun m!388515 () Bool)

(assert (=> b!259201 m!388515))

(push 1)

(assert (not b!259199))

(assert (not b!259198))

(assert (not start!55742))

(assert (not b!259201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

