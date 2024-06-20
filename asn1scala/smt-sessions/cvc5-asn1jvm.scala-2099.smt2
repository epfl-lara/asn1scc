; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53316 () Bool)

(assert start!53316)

(declare-fun b!247411 () Bool)

(declare-fun e!171383 () Bool)

(declare-datatypes ((array!13486 0))(
  ( (array!13487 (arr!6898 (Array (_ BitVec 32) (_ BitVec 8))) (size!5911 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10744 0))(
  ( (BitStream!10745 (buf!6395 array!13486) (currentByte!11808 (_ BitVec 32)) (currentBit!11803 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10744)

(declare-fun array_inv!5652 (array!13486) Bool)

(assert (=> b!247411 (= e!171383 (array_inv!5652 (buf!6395 thiss!1005)))))

(declare-fun b!247412 () Bool)

(declare-fun e!171382 () Bool)

(declare-fun e!171381 () Bool)

(assert (=> b!247412 (= e!171382 (not e!171381))))

(declare-fun res!207052 () Bool)

(assert (=> b!247412 (=> res!207052 e!171381)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247412 (= res!207052 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10744 BitStream!10744) Bool)

(assert (=> b!247412 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17940 0))(
  ( (Unit!17941) )
))
(declare-fun lt!385838 () Unit!17940)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10744) Unit!17940)

(assert (=> b!247412 (= lt!385838 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247413 () Bool)

(declare-fun res!207051 () Bool)

(assert (=> b!247413 (=> (not res!207051) (not e!171382))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247413 (= res!207051 (validate_offset_bits!1 ((_ sign_extend 32) (size!5911 (buf!6395 thiss!1005))) ((_ sign_extend 32) (currentByte!11808 thiss!1005)) ((_ sign_extend 32) (currentBit!11803 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247414 () Bool)

(declare-fun res!207053 () Bool)

(assert (=> b!247414 (=> (not res!207053) (not e!171382))))

(assert (=> b!247414 (= res!207053 (bvsge from!289 nBits!297))))

(declare-fun b!247415 () Bool)

(assert (=> b!247415 (= e!171381 true)))

(declare-fun lt!385839 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247415 (= lt!385839 (bitIndex!0 (size!5911 (buf!6395 thiss!1005)) (currentByte!11808 thiss!1005) (currentBit!11803 thiss!1005)))))

(declare-fun res!207054 () Bool)

(assert (=> start!53316 (=> (not res!207054) (not e!171382))))

(assert (=> start!53316 (= res!207054 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53316 e!171382))

(assert (=> start!53316 true))

(declare-fun inv!12 (BitStream!10744) Bool)

(assert (=> start!53316 (and (inv!12 thiss!1005) e!171383)))

(assert (= (and start!53316 res!207054) b!247413))

(assert (= (and b!247413 res!207051) b!247414))

(assert (= (and b!247414 res!207053) b!247412))

(assert (= (and b!247412 (not res!207052)) b!247415))

(assert (= start!53316 b!247411))

(declare-fun m!373131 () Bool)

(assert (=> b!247415 m!373131))

(declare-fun m!373133 () Bool)

(assert (=> start!53316 m!373133))

(declare-fun m!373135 () Bool)

(assert (=> b!247412 m!373135))

(declare-fun m!373137 () Bool)

(assert (=> b!247412 m!373137))

(declare-fun m!373139 () Bool)

(assert (=> b!247413 m!373139))

(declare-fun m!373141 () Bool)

(assert (=> b!247411 m!373141))

(push 1)

(assert (not b!247412))

(assert (not b!247413))

(assert (not start!53316))

(assert (not b!247411))

(assert (not b!247415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

