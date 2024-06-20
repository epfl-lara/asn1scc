; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53320 () Bool)

(assert start!53320)

(declare-fun b!247441 () Bool)

(declare-fun e!171404 () Bool)

(declare-datatypes ((array!13490 0))(
  ( (array!13491 (arr!6900 (Array (_ BitVec 32) (_ BitVec 8))) (size!5913 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10748 0))(
  ( (BitStream!10749 (buf!6397 array!13490) (currentByte!11810 (_ BitVec 32)) (currentBit!11805 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10748)

(declare-fun array_inv!5654 (array!13490) Bool)

(assert (=> b!247441 (= e!171404 (array_inv!5654 (buf!6397 thiss!1005)))))

(declare-fun b!247442 () Bool)

(declare-fun res!207078 () Bool)

(declare-fun e!171405 () Bool)

(assert (=> b!247442 (=> (not res!207078) (not e!171405))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247442 (= res!207078 (bvsge from!289 nBits!297))))

(declare-fun res!207077 () Bool)

(assert (=> start!53320 (=> (not res!207077) (not e!171405))))

(assert (=> start!53320 (= res!207077 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53320 e!171405))

(assert (=> start!53320 true))

(declare-fun inv!12 (BitStream!10748) Bool)

(assert (=> start!53320 (and (inv!12 thiss!1005) e!171404)))

(declare-fun b!247443 () Bool)

(declare-fun e!171407 () Bool)

(assert (=> b!247443 (= e!171407 true)))

(declare-fun lt!385850 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247443 (= lt!385850 (bitIndex!0 (size!5913 (buf!6397 thiss!1005)) (currentByte!11810 thiss!1005) (currentBit!11805 thiss!1005)))))

(declare-fun b!247444 () Bool)

(assert (=> b!247444 (= e!171405 (not e!171407))))

(declare-fun res!207076 () Bool)

(assert (=> b!247444 (=> res!207076 e!171407)))

(assert (=> b!247444 (= res!207076 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10748 BitStream!10748) Bool)

(assert (=> b!247444 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17944 0))(
  ( (Unit!17945) )
))
(declare-fun lt!385851 () Unit!17944)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10748) Unit!17944)

(assert (=> b!247444 (= lt!385851 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247445 () Bool)

(declare-fun res!207075 () Bool)

(assert (=> b!247445 (=> (not res!207075) (not e!171405))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247445 (= res!207075 (validate_offset_bits!1 ((_ sign_extend 32) (size!5913 (buf!6397 thiss!1005))) ((_ sign_extend 32) (currentByte!11810 thiss!1005)) ((_ sign_extend 32) (currentBit!11805 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53320 res!207077) b!247445))

(assert (= (and b!247445 res!207075) b!247442))

(assert (= (and b!247442 res!207078) b!247444))

(assert (= (and b!247444 (not res!207076)) b!247443))

(assert (= start!53320 b!247441))

(declare-fun m!373155 () Bool)

(assert (=> b!247445 m!373155))

(declare-fun m!373157 () Bool)

(assert (=> start!53320 m!373157))

(declare-fun m!373159 () Bool)

(assert (=> b!247441 m!373159))

(declare-fun m!373161 () Bool)

(assert (=> b!247444 m!373161))

(declare-fun m!373163 () Bool)

(assert (=> b!247444 m!373163))

(declare-fun m!373165 () Bool)

(assert (=> b!247443 m!373165))

(push 1)

(assert (not start!53320))

(assert (not b!247441))

(assert (not b!247443))

(assert (not b!247444))

(assert (not b!247445))

(check-sat)

(pop 1)

(push 1)

