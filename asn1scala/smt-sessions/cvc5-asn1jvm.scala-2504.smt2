; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63336 () Bool)

(assert start!63336)

(declare-datatypes ((array!16471 0))(
  ( (array!16472 (arr!8110 (Array (_ BitVec 32) (_ BitVec 8))) (size!7114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12598 0))(
  ( (BitStream!12599 (buf!7360 array!16471) (currentByte!13632 (_ BitVec 32)) (currentBit!13627 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12598)

(assert (=> start!63336 (not (= (bvand (currentByte!13632 thiss!1939) #b00000000000000000000000000000001) (bvsdiv (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13632 thiss!1939) #b00000000000000000000000000000001)) #b00000000000000000000000000001000)))))

(declare-fun e!202508 () Bool)

(declare-fun inv!12 (BitStream!12598) Bool)

(assert (=> start!63336 (and (inv!12 thiss!1939) e!202508)))

(declare-fun b!283614 () Bool)

(declare-fun array_inv!6807 (array!16471) Bool)

(assert (=> b!283614 (= e!202508 (array_inv!6807 (buf!7360 thiss!1939)))))

(assert (= start!63336 b!283614))

(declare-fun m!416659 () Bool)

(assert (=> start!63336 m!416659))

(declare-fun m!416661 () Bool)

(assert (=> b!283614 m!416661))

(push 1)

(assert (not b!283614))

(assert (not start!63336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

