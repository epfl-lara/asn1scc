; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64434 () Bool)

(assert start!64434)

(declare-fun b!289170 () Bool)

(declare-fun res!238934 () Bool)

(declare-fun e!205694 () Bool)

(assert (=> b!289170 (=> (not res!238934) (not e!205694))))

(declare-datatypes ((array!17101 0))(
  ( (array!17102 (arr!8393 (Array (_ BitVec 32) (_ BitVec 8))) (size!7397 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12804 0))(
  ( (BitStream!12805 (buf!7463 array!17101) (currentByte!13858 (_ BitVec 32)) (currentBit!13853 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12804)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289170 (= res!238934 (validate_offset_bits!1 ((_ sign_extend 32) (size!7397 (buf!7463 thiss!1728))) ((_ sign_extend 32) (currentByte!13858 thiss!1728)) ((_ sign_extend 32) (currentBit!13853 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!238932 () Bool)

(assert (=> start!64434 (=> (not res!238932) (not e!205694))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17101)

(assert (=> start!64434 (= res!238932 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7397 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64434 e!205694))

(declare-fun e!205693 () Bool)

(declare-fun inv!12 (BitStream!12804) Bool)

(assert (=> start!64434 (and (inv!12 thiss!1728) e!205693)))

(assert (=> start!64434 true))

(declare-fun array_inv!7009 (array!17101) Bool)

(assert (=> start!64434 (array_inv!7009 arr!273)))

(declare-fun b!289173 () Bool)

(assert (=> b!289173 (= e!205693 (array_inv!7009 (buf!7463 thiss!1728)))))

(declare-fun b!289172 () Bool)

(assert (=> b!289172 (= e!205694 (not true))))

(declare-datatypes ((tuple2!22652 0))(
  ( (tuple2!22653 (_1!12520 Bool) (_2!12520 BitStream!12804)) )
))
(declare-fun lt!419021 () tuple2!22652)

(assert (=> b!289172 (validate_offset_bits!1 ((_ sign_extend 32) (size!7397 (buf!7463 (_2!12520 lt!419021)))) ((_ sign_extend 32) (currentByte!13858 (_2!12520 lt!419021))) ((_ sign_extend 32) (currentBit!13853 (_2!12520 lt!419021))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20021 0))(
  ( (Unit!20022) )
))
(declare-fun lt!419022 () Unit!20021)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12804 BitStream!12804 (_ BitVec 64) (_ BitVec 64)) Unit!20021)

(assert (=> b!289172 (= lt!419022 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12520 lt!419021) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12804) tuple2!22652)

(assert (=> b!289172 (= lt!419021 (readBit!0 thiss!1728))))

(declare-fun b!289171 () Bool)

(declare-fun res!238933 () Bool)

(assert (=> b!289171 (=> (not res!238933) (not e!205694))))

(assert (=> b!289171 (= res!238933 (bvslt from!505 to!474))))

(assert (= (and start!64434 res!238932) b!289170))

(assert (= (and b!289170 res!238934) b!289171))

(assert (= (and b!289171 res!238933) b!289172))

(assert (= start!64434 b!289173))

(declare-fun m!421887 () Bool)

(assert (=> b!289170 m!421887))

(declare-fun m!421889 () Bool)

(assert (=> start!64434 m!421889))

(declare-fun m!421891 () Bool)

(assert (=> start!64434 m!421891))

(declare-fun m!421893 () Bool)

(assert (=> b!289173 m!421893))

(declare-fun m!421895 () Bool)

(assert (=> b!289172 m!421895))

(declare-fun m!421897 () Bool)

(assert (=> b!289172 m!421897))

(declare-fun m!421899 () Bool)

(assert (=> b!289172 m!421899))

(check-sat (not b!289170) (not b!289173) (not start!64434) (not b!289172))
