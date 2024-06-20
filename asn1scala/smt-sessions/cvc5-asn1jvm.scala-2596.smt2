; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64408 () Bool)

(assert start!64408)

(declare-fun b!288980 () Bool)

(declare-fun res!238784 () Bool)

(declare-fun e!205503 () Bool)

(assert (=> b!288980 (=> (not res!238784) (not e!205503))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!288980 (= res!238784 (bvslt from!505 to!474))))

(declare-fun b!288981 () Bool)

(declare-fun e!205505 () Bool)

(declare-datatypes ((array!17075 0))(
  ( (array!17076 (arr!8380 (Array (_ BitVec 32) (_ BitVec 8))) (size!7384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12778 0))(
  ( (BitStream!12779 (buf!7450 array!17075) (currentByte!13845 (_ BitVec 32)) (currentBit!13840 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12778)

(declare-fun array_inv!6996 (array!17075) Bool)

(assert (=> b!288981 (= e!205505 (array_inv!6996 (buf!7450 thiss!1728)))))

(declare-fun b!288982 () Bool)

(declare-fun e!205502 () Bool)

(assert (=> b!288982 (= e!205503 e!205502)))

(declare-fun res!238781 () Bool)

(assert (=> b!288982 (=> (not res!238781) (not e!205502))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((tuple2!22626 0))(
  ( (tuple2!22627 (_1!12507 Bool) (_2!12507 BitStream!12778)) )
))
(declare-fun lt!418910 () tuple2!22626)

(assert (=> b!288982 (= res!238781 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7384 (buf!7450 thiss!1728)) (size!7384 (buf!7450 (_2!12507 lt!418910))))))))

(declare-fun readBit!0 (BitStream!12778) tuple2!22626)

(assert (=> b!288982 (= lt!418910 (readBit!0 thiss!1728))))

(declare-fun b!288983 () Bool)

(assert (=> b!288983 (= e!205502 false)))

(declare-fun lt!418911 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!288983 (= lt!418911 (bitIndex!0 (size!7384 (buf!7450 (_2!12507 lt!418910))) (currentByte!13845 (_2!12507 lt!418910)) (currentBit!13840 (_2!12507 lt!418910))))))

(declare-fun lt!418909 () (_ BitVec 64))

(assert (=> b!288983 (= lt!418909 (bitIndex!0 (size!7384 (buf!7450 thiss!1728)) (currentByte!13845 thiss!1728) (currentBit!13840 thiss!1728)))))

(declare-fun res!238782 () Bool)

(assert (=> start!64408 (=> (not res!238782) (not e!205503))))

(declare-fun arr!273 () array!17075)

(assert (=> start!64408 (= res!238782 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7384 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64408 e!205503))

(declare-fun inv!12 (BitStream!12778) Bool)

(assert (=> start!64408 (and (inv!12 thiss!1728) e!205505)))

(assert (=> start!64408 true))

(assert (=> start!64408 (array_inv!6996 arr!273)))

(declare-fun b!288984 () Bool)

(declare-fun res!238783 () Bool)

(assert (=> b!288984 (=> (not res!238783) (not e!205503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288984 (= res!238783 (validate_offset_bits!1 ((_ sign_extend 32) (size!7384 (buf!7450 thiss!1728))) ((_ sign_extend 32) (currentByte!13845 thiss!1728)) ((_ sign_extend 32) (currentBit!13840 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64408 res!238782) b!288984))

(assert (= (and b!288984 res!238783) b!288980))

(assert (= (and b!288980 res!238784) b!288982))

(assert (= (and b!288982 res!238781) b!288983))

(assert (= start!64408 b!288981))

(declare-fun m!421705 () Bool)

(assert (=> start!64408 m!421705))

(declare-fun m!421707 () Bool)

(assert (=> start!64408 m!421707))

(declare-fun m!421709 () Bool)

(assert (=> b!288982 m!421709))

(declare-fun m!421711 () Bool)

(assert (=> b!288984 m!421711))

(declare-fun m!421713 () Bool)

(assert (=> b!288983 m!421713))

(declare-fun m!421715 () Bool)

(assert (=> b!288983 m!421715))

(declare-fun m!421717 () Bool)

(assert (=> b!288981 m!421717))

(push 1)

(assert (not start!64408))

(assert (not b!288983))

(assert (not b!288982))

(assert (not b!288981))

(assert (not b!288984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

