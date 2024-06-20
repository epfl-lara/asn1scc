; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65338 () Bool)

(assert start!65338)

(declare-fun b!293121 () Bool)

(declare-fun res!242067 () Bool)

(declare-fun e!209257 () Bool)

(assert (=> b!293121 (=> (not res!242067) (not e!209257))))

(declare-datatypes ((array!17486 0))(
  ( (array!17487 (arr!8602 (Array (_ BitVec 32) (_ BitVec 8))) (size!7576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13156 0))(
  ( (BitStream!13157 (buf!7639 array!17486) (currentByte!14103 (_ BitVec 32)) (currentBit!14098 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13156)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293121 (= res!242067 (validate_offset_bits!1 ((_ sign_extend 32) (size!7576 (buf!7639 thiss!1728))) ((_ sign_extend 32) (currentByte!14103 thiss!1728)) ((_ sign_extend 32) (currentBit!14098 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293124 () Bool)

(declare-fun e!209259 () Bool)

(declare-fun array_inv!7188 (array!17486) Bool)

(assert (=> b!293124 (= e!209259 (array_inv!7188 (buf!7639 thiss!1728)))))

(declare-fun b!293123 () Bool)

(assert (=> b!293123 (= e!209257 (and (bvslt (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22982 0))(
  ( (tuple2!22983 (_1!12796 Bool) (_2!12796 BitStream!13156)) )
))
(declare-fun lt!425187 () tuple2!22982)

(declare-fun readBit!0 (BitStream!13156) tuple2!22982)

(assert (=> b!293123 (= lt!425187 (readBit!0 thiss!1728))))

(declare-fun res!242068 () Bool)

(assert (=> start!65338 (=> (not res!242068) (not e!209257))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17486)

(assert (=> start!65338 (= res!242068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7576 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65338 e!209257))

(declare-fun inv!12 (BitStream!13156) Bool)

(assert (=> start!65338 (and (inv!12 thiss!1728) e!209259)))

(assert (=> start!65338 true))

(assert (=> start!65338 (array_inv!7188 arr!273)))

(declare-fun b!293122 () Bool)

(declare-fun res!242069 () Bool)

(assert (=> b!293122 (=> (not res!242069) (not e!209257))))

(assert (=> b!293122 (= res!242069 (bvslt from!505 to!474))))

(assert (= (and start!65338 res!242068) b!293121))

(assert (= (and b!293121 res!242067) b!293122))

(assert (= (and b!293122 res!242069) b!293123))

(assert (= start!65338 b!293124))

(declare-fun m!428695 () Bool)

(assert (=> b!293121 m!428695))

(declare-fun m!428697 () Bool)

(assert (=> b!293124 m!428697))

(declare-fun m!428699 () Bool)

(assert (=> b!293123 m!428699))

(declare-fun m!428701 () Bool)

(assert (=> start!65338 m!428701))

(declare-fun m!428703 () Bool)

(assert (=> start!65338 m!428703))

(push 1)

(assert (not b!293124))

(assert (not b!293123))

(assert (not b!293121))

(assert (not start!65338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

