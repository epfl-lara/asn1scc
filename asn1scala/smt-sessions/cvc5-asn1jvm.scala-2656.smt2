; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65302 () Bool)

(assert start!65302)

(declare-fun b!292905 () Bool)

(declare-fun res!241906 () Bool)

(declare-fun e!209040 () Bool)

(assert (=> b!292905 (=> (not res!241906) (not e!209040))))

(declare-datatypes ((array!17450 0))(
  ( (array!17451 (arr!8584 (Array (_ BitVec 32) (_ BitVec 8))) (size!7558 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13120 0))(
  ( (BitStream!13121 (buf!7621 array!17450) (currentByte!14085 (_ BitVec 32)) (currentBit!14080 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13120)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292905 (= res!241906 (validate_offset_bits!1 ((_ sign_extend 32) (size!7558 (buf!7621 thiss!1728))) ((_ sign_extend 32) (currentByte!14085 thiss!1728)) ((_ sign_extend 32) (currentBit!14080 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292907 () Bool)

(assert (=> b!292907 (= e!209040 false)))

(declare-datatypes ((tuple2!22946 0))(
  ( (tuple2!22947 (_1!12778 Bool) (_2!12778 BitStream!13120)) )
))
(declare-fun lt!425133 () tuple2!22946)

(declare-fun readBit!0 (BitStream!13120) tuple2!22946)

(assert (=> b!292907 (= lt!425133 (readBit!0 thiss!1728))))

(declare-fun b!292906 () Bool)

(declare-fun res!241905 () Bool)

(assert (=> b!292906 (=> (not res!241905) (not e!209040))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292906 (= res!241905 (bvslt from!505 to!474))))

(declare-fun b!292908 () Bool)

(declare-fun e!209043 () Bool)

(declare-fun array_inv!7170 (array!17450) Bool)

(assert (=> b!292908 (= e!209043 (array_inv!7170 (buf!7621 thiss!1728)))))

(declare-fun res!241907 () Bool)

(assert (=> start!65302 (=> (not res!241907) (not e!209040))))

(declare-fun arr!273 () array!17450)

(assert (=> start!65302 (= res!241907 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7558 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65302 e!209040))

(declare-fun inv!12 (BitStream!13120) Bool)

(assert (=> start!65302 (and (inv!12 thiss!1728) e!209043)))

(assert (=> start!65302 true))

(assert (=> start!65302 (array_inv!7170 arr!273)))

(assert (= (and start!65302 res!241907) b!292905))

(assert (= (and b!292905 res!241906) b!292906))

(assert (= (and b!292906 res!241905) b!292907))

(assert (= start!65302 b!292908))

(declare-fun m!428515 () Bool)

(assert (=> b!292905 m!428515))

(declare-fun m!428517 () Bool)

(assert (=> b!292907 m!428517))

(declare-fun m!428519 () Bool)

(assert (=> b!292908 m!428519))

(declare-fun m!428521 () Bool)

(assert (=> start!65302 m!428521))

(declare-fun m!428523 () Bool)

(assert (=> start!65302 m!428523))

(push 1)

(assert (not b!292907))

(assert (not b!292908))

(assert (not start!65302))

(assert (not b!292905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

