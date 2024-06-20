; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10866 () Bool)

(assert start!10866)

(declare-fun b!54059 () Bool)

(declare-fun e!36046 () Bool)

(declare-datatypes ((array!2536 0))(
  ( (array!2537 (arr!1694 (Array (_ BitVec 32) (_ BitVec 8))) (size!1157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2002 0))(
  ( (BitStream!2003 (buf!1511 array!2536) (currentByte!3084 (_ BitVec 32)) (currentBit!3079 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2002)

(declare-fun array_inv!1060 (array!2536) Bool)

(assert (=> b!54059 (= e!36046 (array_inv!1060 (buf!1511 thiss!1379)))))

(declare-fun b!54060 () Bool)

(declare-fun e!36047 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!54060 (= e!36047 (bvslt (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (bvsub to!314 i!635)))))

(declare-fun e!36045 () Bool)

(assert (=> b!54060 e!36045))

(declare-fun res!45138 () Bool)

(assert (=> b!54060 (=> (not res!45138) (not e!36045))))

(declare-datatypes ((Unit!3723 0))(
  ( (Unit!3724) )
))
(declare-datatypes ((tuple2!4914 0))(
  ( (tuple2!4915 (_1!2568 Unit!3723) (_2!2568 BitStream!2002)) )
))
(declare-fun lt!83661 () tuple2!4914)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54060 (= res!45138 (validate_offset_bits!1 ((_ sign_extend 32) (size!1157 (buf!1511 (_2!2568 lt!83661)))) ((_ sign_extend 32) (currentByte!3084 thiss!1379)) ((_ sign_extend 32) (currentBit!3079 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83662 () Unit!3723)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2002 array!2536 (_ BitVec 64)) Unit!3723)

(assert (=> b!54060 (= lt!83662 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1511 (_2!2568 lt!83661)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4916 0))(
  ( (tuple2!4917 (_1!2569 BitStream!2002) (_2!2569 BitStream!2002)) )
))
(declare-fun lt!83660 () tuple2!4916)

(declare-fun reader!0 (BitStream!2002 BitStream!2002) tuple2!4916)

(assert (=> b!54060 (= lt!83660 (reader!0 thiss!1379 (_2!2568 lt!83661)))))

(declare-fun srcBuffer!2 () array!2536)

(declare-fun b!54061 () Bool)

(declare-datatypes ((List!576 0))(
  ( (Nil!573) (Cons!572 (h!691 Bool) (t!1326 List!576)) )
))
(declare-fun head!395 (List!576) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2002 array!2536 (_ BitVec 64) (_ BitVec 64)) List!576)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2002 BitStream!2002 (_ BitVec 64)) List!576)

(assert (=> b!54061 (= e!36045 (= (head!395 (byteArrayBitContentToList!0 (_2!2568 lt!83661) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!395 (bitStreamReadBitsIntoList!0 (_2!2568 lt!83661) (_1!2569 lt!83660) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54062 () Bool)

(declare-fun e!36041 () Bool)

(declare-fun e!36044 () Bool)

(assert (=> b!54062 (= e!36041 (not e!36044))))

(declare-fun res!45139 () Bool)

(assert (=> b!54062 (=> res!45139 e!36044)))

(assert (=> b!54062 (= res!45139 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2002 BitStream!2002) Bool)

(assert (=> b!54062 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83659 () Unit!3723)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2002) Unit!3723)

(assert (=> b!54062 (= lt!83659 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83657 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54062 (= lt!83657 (bitIndex!0 (size!1157 (buf!1511 thiss!1379)) (currentByte!3084 thiss!1379) (currentBit!3079 thiss!1379)))))

(declare-fun res!45140 () Bool)

(assert (=> start!10866 (=> (not res!45140) (not e!36041))))

(assert (=> start!10866 (= res!45140 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1157 srcBuffer!2))))))))

(assert (=> start!10866 e!36041))

(assert (=> start!10866 true))

(assert (=> start!10866 (array_inv!1060 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2002) Bool)

(assert (=> start!10866 (and (inv!12 thiss!1379) e!36046)))

(declare-fun b!54063 () Bool)

(assert (=> b!54063 (= e!36044 e!36047)))

(declare-fun res!45141 () Bool)

(assert (=> b!54063 (=> res!45141 e!36047)))

(assert (=> b!54063 (= res!45141 (not (isPrefixOf!0 thiss!1379 (_2!2568 lt!83661))))))

(assert (=> b!54063 (validate_offset_bits!1 ((_ sign_extend 32) (size!1157 (buf!1511 (_2!2568 lt!83661)))) ((_ sign_extend 32) (currentByte!3084 (_2!2568 lt!83661))) ((_ sign_extend 32) (currentBit!3079 (_2!2568 lt!83661))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83658 () Unit!3723)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2002 BitStream!2002 (_ BitVec 64) (_ BitVec 64)) Unit!3723)

(assert (=> b!54063 (= lt!83658 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2568 lt!83661) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2002 (_ BitVec 8) (_ BitVec 32)) tuple2!4914)

(assert (=> b!54063 (= lt!83661 (appendBitFromByte!0 thiss!1379 (select (arr!1694 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54064 () Bool)

(declare-fun res!45137 () Bool)

(assert (=> b!54064 (=> (not res!45137) (not e!36041))))

(assert (=> b!54064 (= res!45137 (validate_offset_bits!1 ((_ sign_extend 32) (size!1157 (buf!1511 thiss!1379))) ((_ sign_extend 32) (currentByte!3084 thiss!1379)) ((_ sign_extend 32) (currentBit!3079 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10866 res!45140) b!54064))

(assert (= (and b!54064 res!45137) b!54062))

(assert (= (and b!54062 (not res!45139)) b!54063))

(assert (= (and b!54063 (not res!45141)) b!54060))

(assert (= (and b!54060 res!45138) b!54061))

(assert (= start!10866 b!54059))

(declare-fun m!84907 () Bool)

(assert (=> b!54060 m!84907))

(declare-fun m!84909 () Bool)

(assert (=> b!54060 m!84909))

(declare-fun m!84911 () Bool)

(assert (=> b!54060 m!84911))

(declare-fun m!84913 () Bool)

(assert (=> b!54059 m!84913))

(declare-fun m!84915 () Bool)

(assert (=> b!54063 m!84915))

(declare-fun m!84917 () Bool)

(assert (=> b!54063 m!84917))

(declare-fun m!84919 () Bool)

(assert (=> b!54063 m!84919))

(declare-fun m!84921 () Bool)

(assert (=> b!54063 m!84921))

(assert (=> b!54063 m!84917))

(declare-fun m!84923 () Bool)

(assert (=> b!54063 m!84923))

(declare-fun m!84925 () Bool)

(assert (=> b!54064 m!84925))

(declare-fun m!84927 () Bool)

(assert (=> b!54061 m!84927))

(assert (=> b!54061 m!84927))

(declare-fun m!84929 () Bool)

(assert (=> b!54061 m!84929))

(declare-fun m!84931 () Bool)

(assert (=> b!54061 m!84931))

(assert (=> b!54061 m!84931))

(declare-fun m!84933 () Bool)

(assert (=> b!54061 m!84933))

(declare-fun m!84935 () Bool)

(assert (=> start!10866 m!84935))

(declare-fun m!84937 () Bool)

(assert (=> start!10866 m!84937))

(declare-fun m!84939 () Bool)

(assert (=> b!54062 m!84939))

(declare-fun m!84941 () Bool)

(assert (=> b!54062 m!84941))

(declare-fun m!84943 () Bool)

(assert (=> b!54062 m!84943))

(push 1)

(assert (not start!10866))

(assert (not b!54063))

(assert (not b!54060))

(assert (not b!54064))

(assert (not b!54059))

(assert (not b!54061))

(assert (not b!54062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

