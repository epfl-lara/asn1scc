; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53340 () Bool)

(assert start!53340)

(declare-fun b!247620 () Bool)

(declare-fun e!171556 () Bool)

(declare-fun e!171554 () Bool)

(assert (=> b!247620 (= e!171556 (not e!171554))))

(declare-fun res!207225 () Bool)

(assert (=> b!247620 (=> res!207225 e!171554)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247620 (= res!207225 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13510 0))(
  ( (array!13511 (arr!6910 (Array (_ BitVec 32) (_ BitVec 8))) (size!5923 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10768 0))(
  ( (BitStream!10769 (buf!6407 array!13510) (currentByte!11820 (_ BitVec 32)) (currentBit!11815 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10768)

(declare-fun isPrefixOf!0 (BitStream!10768 BitStream!10768) Bool)

(assert (=> b!247620 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17964 0))(
  ( (Unit!17965) )
))
(declare-fun lt!385943 () Unit!17964)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10768) Unit!17964)

(assert (=> b!247620 (= lt!385943 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247621 () Bool)

(declare-fun e!171557 () Bool)

(assert (=> b!247621 (= e!171557 true)))

(declare-fun lt!385942 () Unit!17964)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10768 array!13510 (_ BitVec 64)) Unit!17964)

(assert (=> b!247621 (= lt!385942 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6407 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!21234 0))(
  ( (tuple2!21235 (_1!11539 BitStream!10768) (_2!11539 BitStream!10768)) )
))
(declare-fun lt!385941 () tuple2!21234)

(declare-fun reader!0 (BitStream!10768 BitStream!10768) tuple2!21234)

(assert (=> b!247621 (= lt!385941 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!207226 () Bool)

(assert (=> start!53340 (=> (not res!207226) (not e!171556))))

(assert (=> start!53340 (= res!207226 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53340 e!171556))

(assert (=> start!53340 true))

(declare-fun e!171555 () Bool)

(declare-fun inv!12 (BitStream!10768) Bool)

(assert (=> start!53340 (and (inv!12 thiss!1005) e!171555)))

(declare-fun b!247622 () Bool)

(declare-fun array_inv!5664 (array!13510) Bool)

(assert (=> b!247622 (= e!171555 (array_inv!5664 (buf!6407 thiss!1005)))))

(declare-fun b!247623 () Bool)

(declare-fun res!207228 () Bool)

(assert (=> b!247623 (=> (not res!207228) (not e!171556))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247623 (= res!207228 (validate_offset_bits!1 ((_ sign_extend 32) (size!5923 (buf!6407 thiss!1005))) ((_ sign_extend 32) (currentByte!11820 thiss!1005)) ((_ sign_extend 32) (currentBit!11815 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247624 () Bool)

(assert (=> b!247624 (= e!171554 e!171557)))

(declare-fun res!207227 () Bool)

(assert (=> b!247624 (=> res!207227 e!171557)))

(declare-fun lt!385944 () (_ BitVec 64))

(assert (=> b!247624 (= res!207227 (not (= lt!385944 (bvadd lt!385944 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247624 (= lt!385944 (bitIndex!0 (size!5923 (buf!6407 thiss!1005)) (currentByte!11820 thiss!1005) (currentBit!11815 thiss!1005)))))

(declare-fun b!247625 () Bool)

(declare-fun res!207224 () Bool)

(assert (=> b!247625 (=> (not res!207224) (not e!171556))))

(assert (=> b!247625 (= res!207224 (bvsge from!289 nBits!297))))

(assert (= (and start!53340 res!207226) b!247623))

(assert (= (and b!247623 res!207228) b!247625))

(assert (= (and b!247625 res!207224) b!247620))

(assert (= (and b!247620 (not res!207225)) b!247624))

(assert (= (and b!247624 (not res!207227)) b!247621))

(assert (= start!53340 b!247622))

(declare-fun m!373293 () Bool)

(assert (=> start!53340 m!373293))

(declare-fun m!373295 () Bool)

(assert (=> b!247620 m!373295))

(declare-fun m!373297 () Bool)

(assert (=> b!247620 m!373297))

(declare-fun m!373299 () Bool)

(assert (=> b!247622 m!373299))

(declare-fun m!373301 () Bool)

(assert (=> b!247623 m!373301))

(declare-fun m!373303 () Bool)

(assert (=> b!247621 m!373303))

(declare-fun m!373305 () Bool)

(assert (=> b!247621 m!373305))

(declare-fun m!373307 () Bool)

(assert (=> b!247624 m!373307))

(push 1)

(assert (not b!247622))

(assert (not b!247621))

(assert (not b!247624))

(assert (not b!247623))

(assert (not b!247620))

(assert (not start!53340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

