; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55736 () Bool)

(assert start!55736)

(declare-fun b!259152 () Bool)

(declare-fun res!217095 () Bool)

(declare-fun e!179787 () Bool)

(assert (=> b!259152 (=> (not res!217095) (not e!179787))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259152 (= res!217095 (not (= from!526 nBits!535)))))

(declare-fun b!259154 () Bool)

(declare-fun e!179786 () Bool)

(declare-datatypes ((array!14152 0))(
  ( (array!14153 (arr!7185 (Array (_ BitVec 32) (_ BitVec 8))) (size!6198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11318 0))(
  ( (BitStream!11319 (buf!6720 array!14152) (currentByte!12355 (_ BitVec 32)) (currentBit!12350 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11318)

(declare-fun array_inv!5939 (array!14152) Bool)

(assert (=> b!259154 (= e!179786 (array_inv!5939 (buf!6720 thiss!1754)))))

(declare-fun b!259155 () Bool)

(declare-fun res!217093 () Bool)

(assert (=> b!259155 (=> (not res!217093) (not e!179787))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259155 (= res!217093 (validate_offset_bits!1 ((_ sign_extend 32) (size!6198 (buf!6720 thiss!1754))) ((_ sign_extend 32) (currentByte!12355 thiss!1754)) ((_ sign_extend 32) (currentBit!12350 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259156 () Bool)

(assert (=> b!259156 (= e!179787 (and (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!217094 () Bool)

(assert (=> start!55736 (=> (not res!217094) (not e!179787))))

(assert (=> start!55736 (= res!217094 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55736 e!179787))

(assert (=> start!55736 true))

(declare-fun inv!12 (BitStream!11318) Bool)

(assert (=> start!55736 (and (inv!12 thiss!1754) e!179786)))

(declare-fun b!259153 () Bool)

(declare-fun res!217096 () Bool)

(assert (=> b!259153 (=> (not res!217096) (not e!179787))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22188 0))(
  ( (tuple2!22189 (_1!12030 Bool) (_2!12030 BitStream!11318)) )
))
(declare-fun readBit!0 (BitStream!11318) tuple2!22188)

(assert (=> b!259153 (= res!217096 (= (_1!12030 (readBit!0 thiss!1754)) expected!109))))

(assert (= (and start!55736 res!217094) b!259155))

(assert (= (and b!259155 res!217093) b!259152))

(assert (= (and b!259152 res!217095) b!259153))

(assert (= (and b!259153 res!217096) b!259156))

(assert (= start!55736 b!259154))

(declare-fun m!388485 () Bool)

(assert (=> b!259154 m!388485))

(declare-fun m!388487 () Bool)

(assert (=> b!259155 m!388487))

(declare-fun m!388489 () Bool)

(assert (=> start!55736 m!388489))

(declare-fun m!388491 () Bool)

(assert (=> b!259153 m!388491))

(push 1)

(assert (not start!55736))

(assert (not b!259155))

(assert (not b!259154))

(assert (not b!259153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

