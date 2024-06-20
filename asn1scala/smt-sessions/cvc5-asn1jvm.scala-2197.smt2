; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55732 () Bool)

(assert start!55732)

(declare-fun b!259123 () Bool)

(declare-fun res!217071 () Bool)

(declare-fun e!179769 () Bool)

(assert (=> b!259123 (=> (not res!217071) (not e!179769))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14148 0))(
  ( (array!14149 (arr!7183 (Array (_ BitVec 32) (_ BitVec 8))) (size!6196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11314 0))(
  ( (BitStream!11315 (buf!6718 array!14148) (currentByte!12353 (_ BitVec 32)) (currentBit!12348 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11314)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259123 (= res!217071 (validate_offset_bits!1 ((_ sign_extend 32) (size!6196 (buf!6718 thiss!1754))) ((_ sign_extend 32) (currentByte!12353 thiss!1754)) ((_ sign_extend 32) (currentBit!12348 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259124 () Bool)

(assert (=> b!259124 (= e!179769 (and (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259125 () Bool)

(declare-fun e!179770 () Bool)

(declare-fun array_inv!5937 (array!14148) Bool)

(assert (=> b!259125 (= e!179770 (array_inv!5937 (buf!6718 thiss!1754)))))

(declare-fun b!259126 () Bool)

(declare-fun res!217072 () Bool)

(assert (=> b!259126 (=> (not res!217072) (not e!179769))))

(assert (=> b!259126 (= res!217072 (not (= from!526 nBits!535)))))

(declare-fun b!259122 () Bool)

(declare-fun res!217069 () Bool)

(assert (=> b!259122 (=> (not res!217069) (not e!179769))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22184 0))(
  ( (tuple2!22185 (_1!12028 Bool) (_2!12028 BitStream!11314)) )
))
(declare-fun readBit!0 (BitStream!11314) tuple2!22184)

(assert (=> b!259122 (= res!217069 (= (_1!12028 (readBit!0 thiss!1754)) expected!109))))

(declare-fun res!217070 () Bool)

(assert (=> start!55732 (=> (not res!217070) (not e!179769))))

(assert (=> start!55732 (= res!217070 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55732 e!179769))

(assert (=> start!55732 true))

(declare-fun inv!12 (BitStream!11314) Bool)

(assert (=> start!55732 (and (inv!12 thiss!1754) e!179770)))

(assert (= (and start!55732 res!217070) b!259123))

(assert (= (and b!259123 res!217071) b!259126))

(assert (= (and b!259126 res!217072) b!259122))

(assert (= (and b!259122 res!217069) b!259124))

(assert (= start!55732 b!259125))

(declare-fun m!388469 () Bool)

(assert (=> b!259123 m!388469))

(declare-fun m!388471 () Bool)

(assert (=> b!259125 m!388471))

(declare-fun m!388473 () Bool)

(assert (=> b!259122 m!388473))

(declare-fun m!388475 () Bool)

(assert (=> start!55732 m!388475))

(push 1)

(assert (not b!259125))

(assert (not b!259123))

(assert (not b!259122))

(assert (not start!55732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

