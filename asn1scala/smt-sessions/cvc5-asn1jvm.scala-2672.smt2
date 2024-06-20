; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65452 () Bool)

(assert start!65452)

(declare-fun res!242397 () Bool)

(declare-fun e!209689 () Bool)

(assert (=> start!65452 (=> (not res!242397) (not e!209689))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17552 0))(
  ( (array!17553 (arr!8632 (Array (_ BitVec 32) (_ BitVec 8))) (size!7606 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17552)

(assert (=> start!65452 (= res!242397 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7606 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65452 e!209689))

(declare-datatypes ((BitStream!13216 0))(
  ( (BitStream!13217 (buf!7669 array!17552) (currentByte!14142 (_ BitVec 32)) (currentBit!14137 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13216)

(declare-fun e!209691 () Bool)

(declare-fun inv!12 (BitStream!13216) Bool)

(assert (=> start!65452 (and (inv!12 thiss!1728) e!209691)))

(assert (=> start!65452 true))

(declare-fun array_inv!7218 (array!17552) Bool)

(assert (=> start!65452 (array_inv!7218 arr!273)))

(declare-fun b!293541 () Bool)

(declare-fun res!242398 () Bool)

(assert (=> b!293541 (=> (not res!242398) (not e!209689))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293541 (= res!242398 (validate_offset_bits!1 ((_ sign_extend 32) (size!7606 (buf!7669 thiss!1728))) ((_ sign_extend 32) (currentByte!14142 thiss!1728)) ((_ sign_extend 32) (currentBit!14137 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293544 () Bool)

(assert (=> b!293544 (= e!209691 (array_inv!7218 (buf!7669 thiss!1728)))))

(declare-fun b!293543 () Bool)

(assert (=> b!293543 (= e!209689 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23050 0))(
  ( (tuple2!23051 (_1!12830 Bool) (_2!12830 BitStream!13216)) )
))
(declare-fun lt!425504 () tuple2!23050)

(assert (=> b!293543 (validate_offset_bits!1 ((_ sign_extend 32) (size!7606 (buf!7669 (_2!12830 lt!425504)))) ((_ sign_extend 32) (currentByte!14142 (_2!12830 lt!425504))) ((_ sign_extend 32) (currentBit!14137 (_2!12830 lt!425504))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20401 0))(
  ( (Unit!20402) )
))
(declare-fun lt!425505 () Unit!20401)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13216 BitStream!13216 (_ BitVec 64) (_ BitVec 64)) Unit!20401)

(assert (=> b!293543 (= lt!425505 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12830 lt!425504) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!13216) tuple2!23050)

(assert (=> b!293543 (= lt!425504 (readBit!0 thiss!1728))))

(declare-fun b!293542 () Bool)

(declare-fun res!242399 () Bool)

(assert (=> b!293542 (=> (not res!242399) (not e!209689))))

(assert (=> b!293542 (= res!242399 (bvslt from!505 to!474))))

(assert (= (and start!65452 res!242397) b!293541))

(assert (= (and b!293541 res!242398) b!293542))

(assert (= (and b!293542 res!242399) b!293543))

(assert (= start!65452 b!293544))

(declare-fun m!429085 () Bool)

(assert (=> start!65452 m!429085))

(declare-fun m!429087 () Bool)

(assert (=> start!65452 m!429087))

(declare-fun m!429089 () Bool)

(assert (=> b!293541 m!429089))

(declare-fun m!429091 () Bool)

(assert (=> b!293544 m!429091))

(declare-fun m!429093 () Bool)

(assert (=> b!293543 m!429093))

(declare-fun m!429095 () Bool)

(assert (=> b!293543 m!429095))

(declare-fun m!429097 () Bool)

(assert (=> b!293543 m!429097))

(push 1)

(assert (not b!293544))

(assert (not b!293541))

(assert (not start!65452))

(assert (not b!293543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

