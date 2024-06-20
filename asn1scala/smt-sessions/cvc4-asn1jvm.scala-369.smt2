; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8546 () Bool)

(assert start!8546)

(declare-fun b!42631 () Bool)

(declare-fun e!28475 () Bool)

(declare-datatypes ((array!2190 0))(
  ( (array!2191 (arr!1489 (Array (_ BitVec 32) (_ BitVec 8))) (size!990 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1724 0))(
  ( (BitStream!1725 (buf!1321 array!2190) (currentByte!2785 (_ BitVec 32)) (currentBit!2780 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1724)

(declare-fun array_inv!915 (array!2190) Bool)

(assert (=> b!42631 (= e!28475 (array_inv!915 (buf!1321 thiss!1379)))))

(declare-fun res!36265 () Bool)

(declare-fun e!28474 () Bool)

(assert (=> start!8546 (=> (not res!36265) (not e!28474))))

(declare-fun srcBuffer!2 () array!2190)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8546 (= res!36265 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!990 srcBuffer!2))))))))

(assert (=> start!8546 e!28474))

(assert (=> start!8546 true))

(assert (=> start!8546 (array_inv!915 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1724) Bool)

(assert (=> start!8546 (and (inv!12 thiss!1379) e!28475)))

(declare-fun b!42628 () Bool)

(declare-fun res!36266 () Bool)

(assert (=> b!42628 (=> (not res!36266) (not e!28474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42628 (= res!36266 (validate_offset_bits!1 ((_ sign_extend 32) (size!990 (buf!1321 thiss!1379))) ((_ sign_extend 32) (currentByte!2785 thiss!1379)) ((_ sign_extend 32) (currentBit!2780 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42629 () Bool)

(declare-fun e!28476 () Bool)

(assert (=> b!42629 (= e!28474 (not e!28476))))

(declare-fun res!36267 () Bool)

(assert (=> b!42629 (=> res!36267 e!28476)))

(assert (=> b!42629 (= res!36267 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1724 BitStream!1724) Bool)

(assert (=> b!42629 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3034 0))(
  ( (Unit!3035) )
))
(declare-fun lt!64027 () Unit!3034)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1724) Unit!3034)

(assert (=> b!42629 (= lt!64027 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64030 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42629 (= lt!64030 (bitIndex!0 (size!990 (buf!1321 thiss!1379)) (currentByte!2785 thiss!1379) (currentBit!2780 thiss!1379)))))

(declare-fun b!42630 () Bool)

(assert (=> b!42630 (= e!28476 true)))

(declare-fun lt!64028 () Bool)

(declare-datatypes ((tuple2!4184 0))(
  ( (tuple2!4185 (_1!2185 Unit!3034) (_2!2185 BitStream!1724)) )
))
(declare-fun lt!64026 () tuple2!4184)

(assert (=> b!42630 (= lt!64028 (isPrefixOf!0 thiss!1379 (_2!2185 lt!64026)))))

(assert (=> b!42630 (validate_offset_bits!1 ((_ sign_extend 32) (size!990 (buf!1321 (_2!2185 lt!64026)))) ((_ sign_extend 32) (currentByte!2785 (_2!2185 lt!64026))) ((_ sign_extend 32) (currentBit!2780 (_2!2185 lt!64026))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64029 () Unit!3034)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1724 BitStream!1724 (_ BitVec 64) (_ BitVec 64)) Unit!3034)

(assert (=> b!42630 (= lt!64029 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2185 lt!64026) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1724 (_ BitVec 8) (_ BitVec 32)) tuple2!4184)

(assert (=> b!42630 (= lt!64026 (appendBitFromByte!0 thiss!1379 (select (arr!1489 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!8546 res!36265) b!42628))

(assert (= (and b!42628 res!36266) b!42629))

(assert (= (and b!42629 (not res!36267)) b!42630))

(assert (= start!8546 b!42631))

(declare-fun m!64627 () Bool)

(assert (=> b!42628 m!64627))

(declare-fun m!64629 () Bool)

(assert (=> b!42629 m!64629))

(declare-fun m!64631 () Bool)

(assert (=> b!42629 m!64631))

(declare-fun m!64633 () Bool)

(assert (=> b!42629 m!64633))

(declare-fun m!64635 () Bool)

(assert (=> b!42631 m!64635))

(declare-fun m!64637 () Bool)

(assert (=> start!8546 m!64637))

(declare-fun m!64639 () Bool)

(assert (=> start!8546 m!64639))

(declare-fun m!64641 () Bool)

(assert (=> b!42630 m!64641))

(declare-fun m!64643 () Bool)

(assert (=> b!42630 m!64643))

(declare-fun m!64645 () Bool)

(assert (=> b!42630 m!64645))

(declare-fun m!64647 () Bool)

(assert (=> b!42630 m!64647))

(assert (=> b!42630 m!64641))

(declare-fun m!64649 () Bool)

(assert (=> b!42630 m!64649))

(push 1)

