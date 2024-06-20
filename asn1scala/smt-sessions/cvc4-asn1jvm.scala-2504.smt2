; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63340 () Bool)

(assert start!63340)

(declare-datatypes ((array!16475 0))(
  ( (array!16476 (arr!8112 (Array (_ BitVec 32) (_ BitVec 8))) (size!7116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12602 0))(
  ( (BitStream!12603 (buf!7362 array!16475) (currentByte!13634 (_ BitVec 32)) (currentBit!13629 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12602)

(assert (=> start!63340 (not (= (bvand (currentByte!13634 thiss!1939) #b00000000000000000000000000000001) (bvsdiv (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13634 thiss!1939) #b00000000000000000000000000000001)) #b00000000000000000000000000001000)))))

(declare-fun e!202520 () Bool)

(declare-fun inv!12 (BitStream!12602) Bool)

(assert (=> start!63340 (and (inv!12 thiss!1939) e!202520)))

(declare-fun b!283620 () Bool)

(declare-fun array_inv!6809 (array!16475) Bool)

(assert (=> b!283620 (= e!202520 (array_inv!6809 (buf!7362 thiss!1939)))))

(assert (= start!63340 b!283620))

(declare-fun m!416667 () Bool)

(assert (=> start!63340 m!416667))

(declare-fun m!416669 () Bool)

(assert (=> b!283620 m!416669))

(push 1)

(assert (not b!283620))

