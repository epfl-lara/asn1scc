; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4842 () Bool)

(assert start!4842)

(declare-fun b!19136 () Bool)

(declare-fun e!12589 () Bool)

(declare-datatypes ((array!1366 0))(
  ( (array!1367 (arr!1019 (Array (_ BitVec 32) (_ BitVec 8))) (size!578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!990 0))(
  ( (BitStream!991 (buf!878 array!1366) (currentByte!2158 (_ BitVec 32)) (currentBit!2153 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!990)

(declare-fun array_inv!548 (array!1366) Bool)

(assert (=> b!19136 (= e!12589 (array_inv!548 (buf!878 thiss!1379)))))

(declare-fun res!16729 () Bool)

(declare-fun e!12587 () Bool)

(assert (=> start!4842 (=> (not res!16729) (not e!12587))))

(declare-fun srcBuffer!2 () array!1366)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4842 (= res!16729 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!578 srcBuffer!2))))))))

(assert (=> start!4842 e!12587))

(assert (=> start!4842 true))

(assert (=> start!4842 (array_inv!548 srcBuffer!2)))

(declare-fun inv!12 (BitStream!990) Bool)

(assert (=> start!4842 (and (inv!12 thiss!1379) e!12589)))

(declare-fun b!19135 () Bool)

(declare-fun e!12591 () Bool)

(assert (=> b!19135 (= e!12591 true)))

(declare-fun lt!27193 () Bool)

(declare-datatypes ((Unit!1700 0))(
  ( (Unit!1701) )
))
(declare-datatypes ((tuple2!2164 0))(
  ( (tuple2!2165 (_1!1167 Unit!1700) (_2!1167 BitStream!990)) )
))
(declare-fun lt!27194 () tuple2!2164)

(declare-fun isPrefixOf!0 (BitStream!990 BitStream!990) Bool)

(assert (=> b!19135 (= lt!27193 (isPrefixOf!0 thiss!1379 (_2!1167 lt!27194)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19135 (validate_offset_bits!1 ((_ sign_extend 32) (size!578 (buf!878 (_2!1167 lt!27194)))) ((_ sign_extend 32) (currentByte!2158 (_2!1167 lt!27194))) ((_ sign_extend 32) (currentBit!2153 (_2!1167 lt!27194))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27196 () Unit!1700)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!990 BitStream!990 (_ BitVec 64) (_ BitVec 64)) Unit!1700)

(assert (=> b!19135 (= lt!27196 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1167 lt!27194) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!990 (_ BitVec 8) (_ BitVec 32)) tuple2!2164)

(assert (=> b!19135 (= lt!27194 (appendBitFromByte!0 thiss!1379 (select (arr!1019 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19134 () Bool)

(assert (=> b!19134 (= e!12587 (not e!12591))))

(declare-fun res!16730 () Bool)

(assert (=> b!19134 (=> res!16730 e!12591)))

(assert (=> b!19134 (= res!16730 (bvsge i!635 to!314))))

(assert (=> b!19134 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27192 () Unit!1700)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!990) Unit!1700)

(assert (=> b!19134 (= lt!27192 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27195 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19134 (= lt!27195 (bitIndex!0 (size!578 (buf!878 thiss!1379)) (currentByte!2158 thiss!1379) (currentBit!2153 thiss!1379)))))

(declare-fun b!19133 () Bool)

(declare-fun res!16728 () Bool)

(assert (=> b!19133 (=> (not res!16728) (not e!12587))))

(assert (=> b!19133 (= res!16728 (validate_offset_bits!1 ((_ sign_extend 32) (size!578 (buf!878 thiss!1379))) ((_ sign_extend 32) (currentByte!2158 thiss!1379)) ((_ sign_extend 32) (currentBit!2153 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4842 res!16729) b!19133))

(assert (= (and b!19133 res!16728) b!19134))

(assert (= (and b!19134 (not res!16730)) b!19135))

(assert (= start!4842 b!19136))

(declare-fun m!25659 () Bool)

(assert (=> start!4842 m!25659))

(declare-fun m!25661 () Bool)

(assert (=> start!4842 m!25661))

(declare-fun m!25663 () Bool)

(assert (=> b!19135 m!25663))

(declare-fun m!25665 () Bool)

(assert (=> b!19135 m!25665))

(declare-fun m!25667 () Bool)

(assert (=> b!19135 m!25667))

(declare-fun m!25669 () Bool)

(assert (=> b!19135 m!25669))

(assert (=> b!19135 m!25665))

(declare-fun m!25671 () Bool)

(assert (=> b!19135 m!25671))

(declare-fun m!25673 () Bool)

(assert (=> b!19136 m!25673))

(declare-fun m!25675 () Bool)

(assert (=> b!19134 m!25675))

(declare-fun m!25677 () Bool)

(assert (=> b!19134 m!25677))

(declare-fun m!25679 () Bool)

(assert (=> b!19134 m!25679))

(declare-fun m!25681 () Bool)

(assert (=> b!19133 m!25681))

(check-sat (not b!19136) (not b!19134) (not start!4842) (not b!19135) (not b!19133))
