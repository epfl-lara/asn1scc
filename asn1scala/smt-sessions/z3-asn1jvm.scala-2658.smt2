; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65316 () Bool)

(assert start!65316)

(declare-fun b!292989 () Bool)

(declare-fun res!241969 () Bool)

(declare-fun e!209127 () Bool)

(assert (=> b!292989 (=> (not res!241969) (not e!209127))))

(declare-datatypes ((array!17464 0))(
  ( (array!17465 (arr!8591 (Array (_ BitVec 32) (_ BitVec 8))) (size!7565 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13134 0))(
  ( (BitStream!13135 (buf!7628 array!17464) (currentByte!14092 (_ BitVec 32)) (currentBit!14087 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13134)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292989 (= res!241969 (validate_offset_bits!1 ((_ sign_extend 32) (size!7565 (buf!7628 thiss!1728))) ((_ sign_extend 32) (currentByte!14092 thiss!1728)) ((_ sign_extend 32) (currentBit!14087 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292992 () Bool)

(declare-fun e!209126 () Bool)

(declare-fun array_inv!7177 (array!17464) Bool)

(assert (=> b!292992 (= e!209126 (array_inv!7177 (buf!7628 thiss!1728)))))

(declare-fun b!292990 () Bool)

(declare-fun res!241968 () Bool)

(assert (=> b!292990 (=> (not res!241968) (not e!209127))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292990 (= res!241968 (bvslt from!505 to!474))))

(declare-fun b!292991 () Bool)

(assert (=> b!292991 (= e!209127 (bvsge (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!22960 0))(
  ( (tuple2!22961 (_1!12785 Bool) (_2!12785 BitStream!13134)) )
))
(declare-fun lt!425154 () tuple2!22960)

(declare-fun readBit!0 (BitStream!13134) tuple2!22960)

(assert (=> b!292991 (= lt!425154 (readBit!0 thiss!1728))))

(declare-fun res!241970 () Bool)

(assert (=> start!65316 (=> (not res!241970) (not e!209127))))

(declare-fun arr!273 () array!17464)

(assert (=> start!65316 (= res!241970 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7565 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65316 e!209127))

(declare-fun inv!12 (BitStream!13134) Bool)

(assert (=> start!65316 (and (inv!12 thiss!1728) e!209126)))

(assert (=> start!65316 true))

(assert (=> start!65316 (array_inv!7177 arr!273)))

(assert (= (and start!65316 res!241970) b!292989))

(assert (= (and b!292989 res!241969) b!292990))

(assert (= (and b!292990 res!241968) b!292991))

(assert (= start!65316 b!292992))

(declare-fun m!428585 () Bool)

(assert (=> b!292989 m!428585))

(declare-fun m!428587 () Bool)

(assert (=> b!292992 m!428587))

(declare-fun m!428589 () Bool)

(assert (=> b!292991 m!428589))

(declare-fun m!428591 () Bool)

(assert (=> start!65316 m!428591))

(declare-fun m!428593 () Bool)

(assert (=> start!65316 m!428593))

(check-sat (not start!65316) (not b!292989) (not b!292991) (not b!292992))
(check-sat)
