; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65310 () Bool)

(assert start!65310)

(declare-fun b!292954 () Bool)

(declare-fun res!241942 () Bool)

(declare-fun e!209089 () Bool)

(assert (=> b!292954 (=> (not res!241942) (not e!209089))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292954 (= res!241942 (bvslt from!505 to!474))))

(declare-fun b!292955 () Bool)

(assert (=> b!292955 (= e!209089 false)))

(declare-datatypes ((array!17458 0))(
  ( (array!17459 (arr!8588 (Array (_ BitVec 32) (_ BitVec 8))) (size!7562 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13128 0))(
  ( (BitStream!13129 (buf!7625 array!17458) (currentByte!14089 (_ BitVec 32)) (currentBit!14084 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22954 0))(
  ( (tuple2!22955 (_1!12782 Bool) (_2!12782 BitStream!13128)) )
))
(declare-fun lt!425145 () tuple2!22954)

(declare-fun thiss!1728 () BitStream!13128)

(declare-fun readBit!0 (BitStream!13128) tuple2!22954)

(assert (=> b!292955 (= lt!425145 (readBit!0 thiss!1728))))

(declare-fun b!292956 () Bool)

(declare-fun e!209090 () Bool)

(declare-fun array_inv!7174 (array!17458) Bool)

(assert (=> b!292956 (= e!209090 (array_inv!7174 (buf!7625 thiss!1728)))))

(declare-fun b!292953 () Bool)

(declare-fun res!241943 () Bool)

(assert (=> b!292953 (=> (not res!241943) (not e!209089))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292953 (= res!241943 (validate_offset_bits!1 ((_ sign_extend 32) (size!7562 (buf!7625 thiss!1728))) ((_ sign_extend 32) (currentByte!14089 thiss!1728)) ((_ sign_extend 32) (currentBit!14084 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241941 () Bool)

(assert (=> start!65310 (=> (not res!241941) (not e!209089))))

(declare-fun arr!273 () array!17458)

(assert (=> start!65310 (= res!241941 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7562 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65310 e!209089))

(declare-fun inv!12 (BitStream!13128) Bool)

(assert (=> start!65310 (and (inv!12 thiss!1728) e!209090)))

(assert (=> start!65310 true))

(assert (=> start!65310 (array_inv!7174 arr!273)))

(assert (= (and start!65310 res!241941) b!292953))

(assert (= (and b!292953 res!241943) b!292954))

(assert (= (and b!292954 res!241942) b!292955))

(assert (= start!65310 b!292956))

(declare-fun m!428555 () Bool)

(assert (=> b!292955 m!428555))

(declare-fun m!428557 () Bool)

(assert (=> b!292956 m!428557))

(declare-fun m!428559 () Bool)

(assert (=> b!292953 m!428559))

(declare-fun m!428561 () Bool)

(assert (=> start!65310 m!428561))

(declare-fun m!428563 () Bool)

(assert (=> start!65310 m!428563))

(check-sat (not start!65310) (not b!292953) (not b!292955) (not b!292956))
