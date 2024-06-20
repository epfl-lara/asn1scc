; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55162 () Bool)

(assert start!55162)

(declare-fun b!257454 () Bool)

(declare-fun res!215766 () Bool)

(declare-fun e!178526 () Bool)

(assert (=> b!257454 (=> (not res!215766) (not e!178526))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13998 0))(
  ( (array!13999 (arr!7126 (Array (_ BitVec 32) (_ BitVec 8))) (size!6139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11200 0))(
  ( (BitStream!11201 (buf!6661 array!13998) (currentByte!12206 (_ BitVec 32)) (currentBit!12201 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11200)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257454 (= res!215766 (validate_offset_bits!1 ((_ sign_extend 32) (size!6139 (buf!6661 thiss!1754))) ((_ sign_extend 32) (currentByte!12206 thiss!1754)) ((_ sign_extend 32) (currentBit!12201 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215767 () Bool)

(assert (=> start!55162 (=> (not res!215767) (not e!178526))))

(assert (=> start!55162 (= res!215767 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55162 e!178526))

(assert (=> start!55162 true))

(declare-fun e!178528 () Bool)

(declare-fun inv!12 (BitStream!11200) Bool)

(assert (=> start!55162 (and (inv!12 thiss!1754) e!178528)))

(declare-fun b!257455 () Bool)

(declare-fun e!178525 () Bool)

(assert (=> b!257455 (= e!178526 e!178525)))

(declare-fun res!215765 () Bool)

(assert (=> b!257455 (=> (not res!215765) (not e!178525))))

(declare-datatypes ((tuple2!22028 0))(
  ( (tuple2!22029 (_1!11950 Bool) (_2!11950 BitStream!11200)) )
))
(declare-fun lt!398732 () tuple2!22028)

(declare-fun expected!109 () Bool)

(assert (=> b!257455 (= res!215765 (= (_1!11950 lt!398732) expected!109))))

(declare-fun readBit!0 (BitStream!11200) tuple2!22028)

(assert (=> b!257455 (= lt!398732 (readBit!0 thiss!1754))))

(declare-fun b!257456 () Bool)

(declare-fun res!215764 () Bool)

(assert (=> b!257456 (=> (not res!215764) (not e!178526))))

(assert (=> b!257456 (= res!215764 (not (= from!526 nBits!535)))))

(declare-fun b!257457 () Bool)

(declare-fun array_inv!5880 (array!13998) Bool)

(assert (=> b!257457 (= e!178528 (array_inv!5880 (buf!6661 thiss!1754)))))

(declare-fun b!257458 () Bool)

(assert (=> b!257458 (= e!178525 (not true))))

(assert (=> b!257458 (validate_offset_bits!1 ((_ sign_extend 32) (size!6139 (buf!6661 (_2!11950 lt!398732)))) ((_ sign_extend 32) (currentByte!12206 (_2!11950 lt!398732))) ((_ sign_extend 32) (currentBit!12201 (_2!11950 lt!398732))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18381 0))(
  ( (Unit!18382) )
))
(declare-fun lt!398731 () Unit!18381)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11200 BitStream!11200 (_ BitVec 64) (_ BitVec 64)) Unit!18381)

(assert (=> b!257458 (= lt!398731 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11950 lt!398732) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!55162 res!215767) b!257454))

(assert (= (and b!257454 res!215766) b!257456))

(assert (= (and b!257456 res!215764) b!257455))

(assert (= (and b!257455 res!215765) b!257458))

(assert (= start!55162 b!257457))

(declare-fun m!386957 () Bool)

(assert (=> b!257457 m!386957))

(declare-fun m!386959 () Bool)

(assert (=> b!257455 m!386959))

(declare-fun m!386961 () Bool)

(assert (=> b!257458 m!386961))

(declare-fun m!386963 () Bool)

(assert (=> b!257458 m!386963))

(declare-fun m!386965 () Bool)

(assert (=> start!55162 m!386965))

(declare-fun m!386967 () Bool)

(assert (=> b!257454 m!386967))

(push 1)

(assert (not start!55162))

(assert (not b!257455))

(assert (not b!257458))

(assert (not b!257454))

(assert (not b!257457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

