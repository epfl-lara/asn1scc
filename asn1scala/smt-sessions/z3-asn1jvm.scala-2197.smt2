; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55734 () Bool)

(assert start!55734)

(declare-fun b!259137 () Bool)

(declare-fun e!179777 () Bool)

(declare-datatypes ((array!14150 0))(
  ( (array!14151 (arr!7184 (Array (_ BitVec 32) (_ BitVec 8))) (size!6197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11316 0))(
  ( (BitStream!11317 (buf!6719 array!14150) (currentByte!12354 (_ BitVec 32)) (currentBit!12349 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11316)

(declare-fun array_inv!5938 (array!14150) Bool)

(assert (=> b!259137 (= e!179777 (array_inv!5938 (buf!6719 thiss!1754)))))

(declare-fun b!259138 () Bool)

(declare-fun res!217081 () Bool)

(declare-fun e!179779 () Bool)

(assert (=> b!259138 (=> (not res!217081) (not e!179779))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22186 0))(
  ( (tuple2!22187 (_1!12029 Bool) (_2!12029 BitStream!11316)) )
))
(declare-fun readBit!0 (BitStream!11316) tuple2!22186)

(assert (=> b!259138 (= res!217081 (= (_1!12029 (readBit!0 thiss!1754)) expected!109))))

(declare-fun b!259139 () Bool)

(declare-fun res!217084 () Bool)

(assert (=> b!259139 (=> (not res!217084) (not e!179779))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259139 (= res!217084 (not (= from!526 nBits!535)))))

(declare-fun b!259140 () Bool)

(declare-fun res!217083 () Bool)

(assert (=> b!259140 (=> (not res!217083) (not e!179779))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259140 (= res!217083 (validate_offset_bits!1 ((_ sign_extend 32) (size!6197 (buf!6719 thiss!1754))) ((_ sign_extend 32) (currentByte!12354 thiss!1754)) ((_ sign_extend 32) (currentBit!12349 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217082 () Bool)

(assert (=> start!55734 (=> (not res!217082) (not e!179779))))

(assert (=> start!55734 (= res!217082 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55734 e!179779))

(assert (=> start!55734 true))

(declare-fun inv!12 (BitStream!11316) Bool)

(assert (=> start!55734 (and (inv!12 thiss!1754) e!179777)))

(declare-fun b!259141 () Bool)

(assert (=> b!259141 (= e!179779 (and (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!55734 res!217082) b!259140))

(assert (= (and b!259140 res!217083) b!259139))

(assert (= (and b!259139 res!217084) b!259138))

(assert (= (and b!259138 res!217081) b!259141))

(assert (= start!55734 b!259137))

(declare-fun m!388477 () Bool)

(assert (=> b!259137 m!388477))

(declare-fun m!388479 () Bool)

(assert (=> b!259138 m!388479))

(declare-fun m!388481 () Bool)

(assert (=> b!259140 m!388481))

(declare-fun m!388483 () Bool)

(assert (=> start!55734 m!388483))

(check-sat (not b!259138) (not b!259137) (not start!55734) (not b!259140))
(check-sat)
