; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65314 () Bool)

(assert start!65314)

(declare-fun res!241960 () Bool)

(declare-fun e!209114 () Bool)

(assert (=> start!65314 (=> (not res!241960) (not e!209114))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17462 0))(
  ( (array!17463 (arr!8590 (Array (_ BitVec 32) (_ BitVec 8))) (size!7564 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17462)

(assert (=> start!65314 (= res!241960 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7564 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65314 e!209114))

(declare-datatypes ((BitStream!13132 0))(
  ( (BitStream!13133 (buf!7627 array!17462) (currentByte!14091 (_ BitVec 32)) (currentBit!14086 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13132)

(declare-fun e!209113 () Bool)

(declare-fun inv!12 (BitStream!13132) Bool)

(assert (=> start!65314 (and (inv!12 thiss!1728) e!209113)))

(assert (=> start!65314 true))

(declare-fun array_inv!7176 (array!17462) Bool)

(assert (=> start!65314 (array_inv!7176 arr!273)))

(declare-fun b!292978 () Bool)

(declare-fun res!241959 () Bool)

(assert (=> b!292978 (=> (not res!241959) (not e!209114))))

(assert (=> b!292978 (= res!241959 (bvslt from!505 to!474))))

(declare-fun b!292980 () Bool)

(assert (=> b!292980 (= e!209113 (array_inv!7176 (buf!7627 thiss!1728)))))

(declare-fun b!292979 () Bool)

(assert (=> b!292979 (= e!209114 (bvsge (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!22958 0))(
  ( (tuple2!22959 (_1!12784 Bool) (_2!12784 BitStream!13132)) )
))
(declare-fun lt!425151 () tuple2!22958)

(declare-fun readBit!0 (BitStream!13132) tuple2!22958)

(assert (=> b!292979 (= lt!425151 (readBit!0 thiss!1728))))

(declare-fun b!292977 () Bool)

(declare-fun res!241961 () Bool)

(assert (=> b!292977 (=> (not res!241961) (not e!209114))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292977 (= res!241961 (validate_offset_bits!1 ((_ sign_extend 32) (size!7564 (buf!7627 thiss!1728))) ((_ sign_extend 32) (currentByte!14091 thiss!1728)) ((_ sign_extend 32) (currentBit!14086 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65314 res!241960) b!292977))

(assert (= (and b!292977 res!241961) b!292978))

(assert (= (and b!292978 res!241959) b!292979))

(assert (= start!65314 b!292980))

(declare-fun m!428575 () Bool)

(assert (=> start!65314 m!428575))

(declare-fun m!428577 () Bool)

(assert (=> start!65314 m!428577))

(declare-fun m!428579 () Bool)

(assert (=> b!292980 m!428579))

(declare-fun m!428581 () Bool)

(assert (=> b!292979 m!428581))

(declare-fun m!428583 () Bool)

(assert (=> b!292977 m!428583))

(push 1)

(assert (not b!292979))

(assert (not b!292980))

(assert (not start!65314))

(assert (not b!292977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

