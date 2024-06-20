; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65734 () Bool)

(assert start!65734)

(declare-fun b!294866 () Bool)

(declare-datatypes ((array!17666 0))(
  ( (array!17667 (arr!8695 (Array (_ BitVec 32) (_ BitVec 8))) (size!7657 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13318 0))(
  ( (BitStream!13319 (buf!7720 array!17666) (currentByte!14217 (_ BitVec 32)) (currentBit!14212 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13318)

(declare-datatypes ((Unit!20551 0))(
  ( (Unit!20552) )
))
(declare-datatypes ((tuple3!1830 0))(
  ( (tuple3!1831 (_1!12953 Unit!20551) (_2!12953 BitStream!13318) (_3!1353 array!17666)) )
))
(declare-fun lt!428426 () tuple3!1830)

(declare-fun e!210826 () Bool)

(declare-fun arr!273 () array!17666)

(assert (=> b!294866 (= e!210826 (and (= (buf!7720 thiss!1728) (buf!7720 (_2!12953 lt!428426))) (= (size!7657 arr!273) (size!7657 (_3!1353 lt!428426)))))))

(declare-fun b!294867 () Bool)

(declare-fun res!243472 () Bool)

(declare-fun e!210825 () Bool)

(assert (=> b!294867 (=> (not res!243472) (not e!210825))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294867 (= res!243472 (bvslt from!505 to!474))))

(declare-fun b!294869 () Bool)

(declare-fun e!210828 () Bool)

(declare-fun array_inv!7269 (array!17666) Bool)

(assert (=> b!294869 (= e!210828 (array_inv!7269 (buf!7720 thiss!1728)))))

(declare-fun b!294870 () Bool)

(assert (=> b!294870 (= e!210825 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7657 arr!273)))) (bvslt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(declare-fun arrayBitRangesEq!0 (array!17666 array!17666 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294870 (arrayBitRangesEq!0 arr!273 (_3!1353 lt!428426) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428428 () array!17666)

(declare-fun lt!428425 () Unit!20551)

(declare-fun arrayBitRangesEqTransitive!0 (array!17666 array!17666 array!17666 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20551)

(assert (=> b!294870 (= lt!428425 (arrayBitRangesEqTransitive!0 arr!273 lt!428428 (_3!1353 lt!428426) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294870 (arrayBitRangesEq!0 arr!273 lt!428428 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428430 () Unit!20551)

(declare-datatypes ((tuple2!23200 0))(
  ( (tuple2!23201 (_1!12954 Bool) (_2!12954 BitStream!13318)) )
))
(declare-fun lt!428424 () tuple2!23200)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17666 (_ BitVec 64) Bool) Unit!20551)

(assert (=> b!294870 (= lt!428430 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12954 lt!428424)))))

(assert (=> b!294870 e!210826))

(declare-fun res!243473 () Bool)

(assert (=> b!294870 (=> (not res!243473) (not e!210826))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294870 (= res!243473 (= (bvsub (bvadd (bitIndex!0 (size!7657 (buf!7720 thiss!1728)) (currentByte!14217 thiss!1728) (currentBit!14212 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7657 (buf!7720 (_2!12953 lt!428426))) (currentByte!14217 (_2!12953 lt!428426)) (currentBit!14212 (_2!12953 lt!428426)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13318 (_ BitVec 64) array!17666 (_ BitVec 64) (_ BitVec 64)) tuple3!1830)

(assert (=> b!294870 (= lt!428426 (readBitsLoop!0 (_2!12954 lt!428424) nBits!523 lt!428428 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294870 (validate_offset_bits!1 ((_ sign_extend 32) (size!7657 (buf!7720 (_2!12954 lt!428424)))) ((_ sign_extend 32) (currentByte!14217 (_2!12954 lt!428424))) ((_ sign_extend 32) (currentBit!14212 (_2!12954 lt!428424))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428427 () Unit!20551)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13318 BitStream!13318 (_ BitVec 64) (_ BitVec 64)) Unit!20551)

(assert (=> b!294870 (= lt!428427 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12954 lt!428424) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428423 () (_ BitVec 32))

(declare-fun lt!428429 () (_ BitVec 32))

(assert (=> b!294870 (= lt!428428 (array!17667 (store (arr!8695 arr!273) lt!428429 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8695 arr!273) lt!428429)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428423)))) ((_ sign_extend 24) (ite (_1!12954 lt!428424) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428423) #b00000000))))) (size!7657 arr!273)))))

(assert (=> b!294870 (= lt!428423 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294870 (= lt!428429 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13318) tuple2!23200)

(assert (=> b!294870 (= lt!428424 (readBit!0 thiss!1728))))

(declare-fun res!243470 () Bool)

(assert (=> start!65734 (=> (not res!243470) (not e!210825))))

(assert (=> start!65734 (= res!243470 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7657 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65734 e!210825))

(declare-fun inv!12 (BitStream!13318) Bool)

(assert (=> start!65734 (and (inv!12 thiss!1728) e!210828)))

(assert (=> start!65734 true))

(assert (=> start!65734 (array_inv!7269 arr!273)))

(declare-fun b!294868 () Bool)

(declare-fun res!243471 () Bool)

(assert (=> b!294868 (=> (not res!243471) (not e!210825))))

(assert (=> b!294868 (= res!243471 (validate_offset_bits!1 ((_ sign_extend 32) (size!7657 (buf!7720 thiss!1728))) ((_ sign_extend 32) (currentByte!14217 thiss!1728)) ((_ sign_extend 32) (currentBit!14212 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65734 res!243470) b!294868))

(assert (= (and b!294868 res!243471) b!294867))

(assert (= (and b!294867 res!243472) b!294870))

(assert (= (and b!294870 res!243473) b!294866))

(assert (= start!65734 b!294869))

(declare-fun m!431587 () Bool)

(assert (=> b!294869 m!431587))

(declare-fun m!431589 () Bool)

(assert (=> b!294870 m!431589))

(declare-fun m!431591 () Bool)

(assert (=> b!294870 m!431591))

(declare-fun m!431593 () Bool)

(assert (=> b!294870 m!431593))

(declare-fun m!431595 () Bool)

(assert (=> b!294870 m!431595))

(declare-fun m!431597 () Bool)

(assert (=> b!294870 m!431597))

(declare-fun m!431599 () Bool)

(assert (=> b!294870 m!431599))

(declare-fun m!431601 () Bool)

(assert (=> b!294870 m!431601))

(declare-fun m!431603 () Bool)

(assert (=> b!294870 m!431603))

(declare-fun m!431605 () Bool)

(assert (=> b!294870 m!431605))

(declare-fun m!431607 () Bool)

(assert (=> b!294870 m!431607))

(declare-fun m!431609 () Bool)

(assert (=> b!294870 m!431609))

(declare-fun m!431611 () Bool)

(assert (=> b!294870 m!431611))

(declare-fun m!431613 () Bool)

(assert (=> b!294870 m!431613))

(declare-fun m!431615 () Bool)

(assert (=> start!65734 m!431615))

(declare-fun m!431617 () Bool)

(assert (=> start!65734 m!431617))

(declare-fun m!431619 () Bool)

(assert (=> b!294868 m!431619))

(push 1)

(assert (not b!294870))

(assert (not b!294869))

(assert (not b!294868))

(assert (not start!65734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

