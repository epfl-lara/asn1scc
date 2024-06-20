; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53350 () Bool)

(assert start!53350)

(declare-fun res!207302 () Bool)

(declare-fun e!171628 () Bool)

(assert (=> start!53350 (=> (not res!207302) (not e!171628))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53350 (= res!207302 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53350 e!171628))

(assert (=> start!53350 true))

(declare-datatypes ((array!13520 0))(
  ( (array!13521 (arr!6915 (Array (_ BitVec 32) (_ BitVec 8))) (size!5928 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10778 0))(
  ( (BitStream!10779 (buf!6412 array!13520) (currentByte!11825 (_ BitVec 32)) (currentBit!11820 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10778)

(declare-fun e!171630 () Bool)

(declare-fun inv!12 (BitStream!10778) Bool)

(assert (=> start!53350 (and (inv!12 thiss!1005) e!171630)))

(declare-fun b!247710 () Bool)

(declare-fun array_inv!5669 (array!13520) Bool)

(assert (=> b!247710 (= e!171630 (array_inv!5669 (buf!6412 thiss!1005)))))

(declare-fun b!247711 () Bool)

(declare-fun res!207300 () Bool)

(assert (=> b!247711 (=> (not res!207300) (not e!171628))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247711 (= res!207300 (validate_offset_bits!1 ((_ sign_extend 32) (size!5928 (buf!6412 thiss!1005))) ((_ sign_extend 32) (currentByte!11825 thiss!1005)) ((_ sign_extend 32) (currentBit!11820 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247712 () Bool)

(declare-fun e!171632 () Bool)

(assert (=> b!247712 (= e!171632 true)))

(declare-datatypes ((Unit!17974 0))(
  ( (Unit!17975) )
))
(declare-fun lt!386004 () Unit!17974)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10778 array!13520 (_ BitVec 64)) Unit!17974)

(assert (=> b!247712 (= lt!386004 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6412 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!21244 0))(
  ( (tuple2!21245 (_1!11544 BitStream!10778) (_2!11544 BitStream!10778)) )
))
(declare-fun lt!386002 () tuple2!21244)

(declare-fun reader!0 (BitStream!10778 BitStream!10778) tuple2!21244)

(assert (=> b!247712 (= lt!386002 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247713 () Bool)

(declare-fun res!207303 () Bool)

(assert (=> b!247713 (=> (not res!207303) (not e!171628))))

(assert (=> b!247713 (= res!207303 (bvsge from!289 nBits!297))))

(declare-fun b!247714 () Bool)

(declare-fun e!171631 () Bool)

(assert (=> b!247714 (= e!171628 (not e!171631))))

(declare-fun res!207301 () Bool)

(assert (=> b!247714 (=> res!207301 e!171631)))

(assert (=> b!247714 (= res!207301 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10778 BitStream!10778) Bool)

(assert (=> b!247714 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!386001 () Unit!17974)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10778) Unit!17974)

(assert (=> b!247714 (= lt!386001 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247715 () Bool)

(assert (=> b!247715 (= e!171631 e!171632)))

(declare-fun res!207299 () Bool)

(assert (=> b!247715 (=> res!207299 e!171632)))

(declare-fun lt!386003 () (_ BitVec 64))

(assert (=> b!247715 (= res!207299 (not (= lt!386003 (bvadd lt!386003 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247715 (= lt!386003 (bitIndex!0 (size!5928 (buf!6412 thiss!1005)) (currentByte!11825 thiss!1005) (currentBit!11820 thiss!1005)))))

(assert (= (and start!53350 res!207302) b!247711))

(assert (= (and b!247711 res!207300) b!247713))

(assert (= (and b!247713 res!207303) b!247714))

(assert (= (and b!247714 (not res!207301)) b!247715))

(assert (= (and b!247715 (not res!207299)) b!247712))

(assert (= start!53350 b!247710))

(declare-fun m!373373 () Bool)

(assert (=> start!53350 m!373373))

(declare-fun m!373375 () Bool)

(assert (=> b!247712 m!373375))

(declare-fun m!373377 () Bool)

(assert (=> b!247712 m!373377))

(declare-fun m!373379 () Bool)

(assert (=> b!247711 m!373379))

(declare-fun m!373381 () Bool)

(assert (=> b!247715 m!373381))

(declare-fun m!373383 () Bool)

(assert (=> b!247710 m!373383))

(declare-fun m!373385 () Bool)

(assert (=> b!247714 m!373385))

(declare-fun m!373387 () Bool)

(assert (=> b!247714 m!373387))

(push 1)

(assert (not b!247712))

(assert (not b!247715))

(assert (not b!247711))

(assert (not b!247714))

(assert (not b!247710))

(assert (not start!53350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

