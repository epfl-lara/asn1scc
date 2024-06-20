; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4956 () Bool)

(assert start!4956)

(declare-fun res!17219 () Bool)

(declare-fun e!13175 () Bool)

(assert (=> start!4956 (=> (not res!17219) (not e!13175))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!4956 (= res!17219 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!4956 e!13175))

(assert (=> start!4956 true))

(declare-datatypes ((array!1423 0))(
  ( (array!1424 (arr!1046 (Array (_ BitVec 32) (_ BitVec 8))) (size!605 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1044 0))(
  ( (BitStream!1045 (buf!908 array!1423) (currentByte!2191 (_ BitVec 32)) (currentBit!2186 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1044)

(declare-fun e!13170 () Bool)

(declare-fun inv!12 (BitStream!1044) Bool)

(assert (=> start!4956 (and (inv!12 thiss!1379) e!13170)))

(declare-fun srcBuffer!2 () array!1423)

(declare-fun array_inv!575 (array!1423) Bool)

(assert (=> start!4956 (array_inv!575 srcBuffer!2)))

(declare-fun b!19722 () Bool)

(declare-fun e!13171 () Bool)

(declare-fun e!13174 () Bool)

(assert (=> b!19722 (= e!13171 (not e!13174))))

(declare-fun res!17215 () Bool)

(assert (=> b!19722 (=> res!17215 e!13174)))

(assert (=> b!19722 (= res!17215 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1044 BitStream!1044) Bool)

(assert (=> b!19722 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1757 0))(
  ( (Unit!1758) )
))
(declare-fun lt!28056 () Unit!1757)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1044) Unit!1757)

(assert (=> b!19722 (= lt!28056 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28057 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19722 (= lt!28057 (bitIndex!0 (size!605 (buf!908 thiss!1379)) (currentByte!2191 thiss!1379) (currentBit!2186 thiss!1379)))))

(declare-fun b!19723 () Bool)

(declare-fun res!17218 () Bool)

(assert (=> b!19723 (=> (not res!17218) (not e!13171))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19723 (= res!17218 (validate_offset_bits!1 ((_ sign_extend 32) (size!605 (buf!908 thiss!1379))) ((_ sign_extend 32) (currentByte!2191 thiss!1379)) ((_ sign_extend 32) (currentBit!2186 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19724 () Bool)

(assert (=> b!19724 (= e!13170 (array_inv!575 (buf!908 thiss!1379)))))

(declare-fun b!19725 () Bool)

(declare-fun e!13172 () Bool)

(declare-fun lt!28054 () (_ BitVec 64))

(assert (=> b!19725 (= e!13172 (or (bvsge i!635 #b0111111111111111111111111111111111111111111111111111111111111110) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) lt!28054)))))

(declare-datatypes ((List!223 0))(
  ( (Nil!220) (Cons!219 (h!338 Bool) (t!973 List!223)) )
))
(declare-fun lt!28059 () List!223)

(declare-datatypes ((tuple2!2280 0))(
  ( (tuple2!2281 (_1!1225 Unit!1757) (_2!1225 BitStream!1044)) )
))
(declare-fun lt!28058 () tuple2!2280)

(declare-datatypes ((tuple2!2282 0))(
  ( (tuple2!2283 (_1!1226 BitStream!1044) (_2!1226 BitStream!1044)) )
))
(declare-fun lt!28055 () tuple2!2282)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1044 BitStream!1044 (_ BitVec 64)) List!223)

(assert (=> b!19725 (= lt!28059 (bitStreamReadBitsIntoList!0 (_2!1225 lt!28058) (_1!1226 lt!28055) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19725 (validate_offset_bits!1 ((_ sign_extend 32) (size!605 (buf!908 (_2!1225 lt!28058)))) ((_ sign_extend 32) (currentByte!2191 thiss!1379)) ((_ sign_extend 32) (currentBit!2186 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28053 () Unit!1757)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1044 array!1423 (_ BitVec 64)) Unit!1757)

(assert (=> b!19725 (= lt!28053 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!908 (_2!1225 lt!28058)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1044 BitStream!1044) tuple2!2282)

(assert (=> b!19725 (= lt!28055 (reader!0 thiss!1379 (_2!1225 lt!28058)))))

(declare-fun b!19726 () Bool)

(assert (=> b!19726 (= e!13175 e!13171)))

(declare-fun res!17217 () Bool)

(assert (=> b!19726 (=> (not res!17217) (not e!13171))))

(assert (=> b!19726 (= res!17217 (bvsle to!314 lt!28054))))

(assert (=> b!19726 (= lt!28054 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!605 srcBuffer!2))))))

(declare-fun b!19727 () Bool)

(assert (=> b!19727 (= e!13174 e!13172)))

(declare-fun res!17216 () Bool)

(assert (=> b!19727 (=> res!17216 e!13172)))

(assert (=> b!19727 (= res!17216 (not (isPrefixOf!0 thiss!1379 (_2!1225 lt!28058))))))

(assert (=> b!19727 (validate_offset_bits!1 ((_ sign_extend 32) (size!605 (buf!908 (_2!1225 lt!28058)))) ((_ sign_extend 32) (currentByte!2191 (_2!1225 lt!28058))) ((_ sign_extend 32) (currentBit!2186 (_2!1225 lt!28058))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28060 () Unit!1757)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1044 BitStream!1044 (_ BitVec 64) (_ BitVec 64)) Unit!1757)

(assert (=> b!19727 (= lt!28060 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1225 lt!28058) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1044 (_ BitVec 8) (_ BitVec 32)) tuple2!2280)

(assert (=> b!19727 (= lt!28058 (appendBitFromByte!0 thiss!1379 (select (arr!1046 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4956 res!17219) b!19726))

(assert (= (and b!19726 res!17217) b!19723))

(assert (= (and b!19723 res!17218) b!19722))

(assert (= (and b!19722 (not res!17215)) b!19727))

(assert (= (and b!19727 (not res!17216)) b!19725))

(assert (= start!4956 b!19724))

(declare-fun m!26675 () Bool)

(assert (=> b!19724 m!26675))

(declare-fun m!26677 () Bool)

(assert (=> b!19725 m!26677))

(declare-fun m!26679 () Bool)

(assert (=> b!19725 m!26679))

(declare-fun m!26681 () Bool)

(assert (=> b!19725 m!26681))

(declare-fun m!26683 () Bool)

(assert (=> b!19725 m!26683))

(declare-fun m!26685 () Bool)

(assert (=> start!4956 m!26685))

(declare-fun m!26687 () Bool)

(assert (=> start!4956 m!26687))

(declare-fun m!26689 () Bool)

(assert (=> b!19723 m!26689))

(declare-fun m!26691 () Bool)

(assert (=> b!19722 m!26691))

(declare-fun m!26693 () Bool)

(assert (=> b!19722 m!26693))

(declare-fun m!26695 () Bool)

(assert (=> b!19722 m!26695))

(declare-fun m!26697 () Bool)

(assert (=> b!19727 m!26697))

(declare-fun m!26699 () Bool)

(assert (=> b!19727 m!26699))

(declare-fun m!26701 () Bool)

(assert (=> b!19727 m!26701))

(declare-fun m!26703 () Bool)

(assert (=> b!19727 m!26703))

(declare-fun m!26705 () Bool)

(assert (=> b!19727 m!26705))

(assert (=> b!19727 m!26701))

(check-sat (not b!19725) (not b!19727) (not b!19722) (not b!19723) (not b!19724) (not start!4956))
(check-sat)
