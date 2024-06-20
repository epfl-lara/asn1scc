; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5632 () Bool)

(assert start!5632)

(declare-fun b!22920 () Bool)

(declare-fun e!15460 () Bool)

(declare-fun e!15457 () Bool)

(assert (=> b!22920 (= e!15460 e!15457)))

(declare-fun res!19689 () Bool)

(assert (=> b!22920 (=> res!19689 e!15457)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!33596 () (_ BitVec 64))

(declare-fun lt!33600 () (_ BitVec 64))

(assert (=> b!22920 (= res!19689 (not (= lt!33596 (bvsub (bvadd lt!33600 to!314) i!635))))))

(declare-datatypes ((array!1555 0))(
  ( (array!1556 (arr!1119 (Array (_ BitVec 32) (_ BitVec 8))) (size!663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1158 0))(
  ( (BitStream!1159 (buf!984 array!1555) (currentByte!2297 (_ BitVec 32)) (currentBit!2292 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1969 0))(
  ( (Unit!1970) )
))
(declare-datatypes ((tuple2!2634 0))(
  ( (tuple2!2635 (_1!1404 Unit!1969) (_2!1404 BitStream!1158)) )
))
(declare-fun lt!33601 () tuple2!2634)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22920 (= lt!33596 (bitIndex!0 (size!663 (buf!984 (_2!1404 lt!33601))) (currentByte!2297 (_2!1404 lt!33601)) (currentBit!2292 (_2!1404 lt!33601))))))

(declare-fun b!22921 () Bool)

(declare-fun res!19681 () Bool)

(assert (=> b!22921 (=> res!19681 e!15457)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22921 (= res!19681 (not (invariant!0 (currentBit!2292 (_2!1404 lt!33601)) (currentByte!2297 (_2!1404 lt!33601)) (size!663 (buf!984 (_2!1404 lt!33601))))))))

(declare-fun b!22922 () Bool)

(declare-fun res!19687 () Bool)

(declare-fun e!15456 () Bool)

(assert (=> b!22922 (=> (not res!19687) (not e!15456))))

(declare-fun thiss!1379 () BitStream!1158)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22922 (= res!19687 (validate_offset_bits!1 ((_ sign_extend 32) (size!663 (buf!984 thiss!1379))) ((_ sign_extend 32) (currentByte!2297 thiss!1379)) ((_ sign_extend 32) (currentBit!2292 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!22923 () Bool)

(declare-fun e!15463 () Bool)

(assert (=> b!22923 (= e!15463 e!15460)))

(declare-fun res!19680 () Bool)

(assert (=> b!22923 (=> res!19680 e!15460)))

(declare-fun lt!33594 () tuple2!2634)

(declare-fun isPrefixOf!0 (BitStream!1158 BitStream!1158) Bool)

(assert (=> b!22923 (= res!19680 (not (isPrefixOf!0 (_2!1404 lt!33594) (_2!1404 lt!33601))))))

(assert (=> b!22923 (isPrefixOf!0 thiss!1379 (_2!1404 lt!33601))))

(declare-fun lt!33599 () Unit!1969)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1158 BitStream!1158 BitStream!1158) Unit!1969)

(assert (=> b!22923 (= lt!33599 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1404 lt!33594) (_2!1404 lt!33601)))))

(declare-fun srcBuffer!2 () array!1555)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1158 array!1555 (_ BitVec 64) (_ BitVec 64)) tuple2!2634)

(assert (=> b!22923 (= lt!33601 (appendBitsMSBFirstLoop!0 (_2!1404 lt!33594) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15455 () Bool)

(assert (=> b!22923 e!15455))

(declare-fun res!19688 () Bool)

(assert (=> b!22923 (=> (not res!19688) (not e!15455))))

(assert (=> b!22923 (= res!19688 (validate_offset_bits!1 ((_ sign_extend 32) (size!663 (buf!984 (_2!1404 lt!33594)))) ((_ sign_extend 32) (currentByte!2297 thiss!1379)) ((_ sign_extend 32) (currentBit!2292 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33595 () Unit!1969)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1158 array!1555 (_ BitVec 64)) Unit!1969)

(assert (=> b!22923 (= lt!33595 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!984 (_2!1404 lt!33594)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2636 0))(
  ( (tuple2!2637 (_1!1405 BitStream!1158) (_2!1405 BitStream!1158)) )
))
(declare-fun lt!33598 () tuple2!2636)

(declare-fun reader!0 (BitStream!1158 BitStream!1158) tuple2!2636)

(assert (=> b!22923 (= lt!33598 (reader!0 thiss!1379 (_2!1404 lt!33594)))))

(declare-fun b!22924 () Bool)

(declare-fun res!19683 () Bool)

(assert (=> b!22924 (=> res!19683 e!15457)))

(assert (=> b!22924 (= res!19683 (not (= (size!663 (buf!984 thiss!1379)) (size!663 (buf!984 (_2!1404 lt!33601))))))))

(declare-fun b!22925 () Bool)

(declare-datatypes ((List!280 0))(
  ( (Nil!277) (Cons!276 (h!395 Bool) (t!1030 List!280)) )
))
(declare-fun head!117 (List!280) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1158 array!1555 (_ BitVec 64) (_ BitVec 64)) List!280)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1158 BitStream!1158 (_ BitVec 64)) List!280)

(assert (=> b!22925 (= e!15455 (= (head!117 (byteArrayBitContentToList!0 (_2!1404 lt!33594) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!117 (bitStreamReadBitsIntoList!0 (_2!1404 lt!33594) (_1!1405 lt!33598) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22926 () Bool)

(assert (=> b!22926 (= e!15457 true)))

(declare-fun e!15458 () Bool)

(assert (=> b!22926 e!15458))

(declare-fun res!19684 () Bool)

(assert (=> b!22926 (=> (not res!19684) (not e!15458))))

(assert (=> b!22926 (= res!19684 (= (size!663 (buf!984 (_2!1404 lt!33601))) (size!663 (buf!984 thiss!1379))))))

(declare-fun b!22927 () Bool)

(assert (=> b!22927 (= e!15458 (= lt!33596 (bvsub (bvsub (bvadd (bitIndex!0 (size!663 (buf!984 (_2!1404 lt!33594))) (currentByte!2297 (_2!1404 lt!33594)) (currentBit!2292 (_2!1404 lt!33594))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22928 () Bool)

(declare-fun e!15459 () Bool)

(assert (=> b!22928 (= e!15456 (not e!15459))))

(declare-fun res!19685 () Bool)

(assert (=> b!22928 (=> res!19685 e!15459)))

(assert (=> b!22928 (= res!19685 (bvsge i!635 to!314))))

(assert (=> b!22928 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33593 () Unit!1969)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1158) Unit!1969)

(assert (=> b!22928 (= lt!33593 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!22928 (= lt!33600 (bitIndex!0 (size!663 (buf!984 thiss!1379)) (currentByte!2297 thiss!1379) (currentBit!2292 thiss!1379)))))

(declare-fun res!19686 () Bool)

(assert (=> start!5632 (=> (not res!19686) (not e!15456))))

(assert (=> start!5632 (= res!19686 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!663 srcBuffer!2))))))))

(assert (=> start!5632 e!15456))

(assert (=> start!5632 true))

(declare-fun array_inv!632 (array!1555) Bool)

(assert (=> start!5632 (array_inv!632 srcBuffer!2)))

(declare-fun e!15462 () Bool)

(declare-fun inv!12 (BitStream!1158) Bool)

(assert (=> start!5632 (and (inv!12 thiss!1379) e!15462)))

(declare-fun b!22929 () Bool)

(assert (=> b!22929 (= e!15459 e!15463)))

(declare-fun res!19682 () Bool)

(assert (=> b!22929 (=> res!19682 e!15463)))

(assert (=> b!22929 (= res!19682 (not (isPrefixOf!0 thiss!1379 (_2!1404 lt!33594))))))

(assert (=> b!22929 (validate_offset_bits!1 ((_ sign_extend 32) (size!663 (buf!984 (_2!1404 lt!33594)))) ((_ sign_extend 32) (currentByte!2297 (_2!1404 lt!33594))) ((_ sign_extend 32) (currentBit!2292 (_2!1404 lt!33594))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33597 () Unit!1969)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1158 BitStream!1158 (_ BitVec 64) (_ BitVec 64)) Unit!1969)

(assert (=> b!22929 (= lt!33597 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1404 lt!33594) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1158 (_ BitVec 8) (_ BitVec 32)) tuple2!2634)

(assert (=> b!22929 (= lt!33594 (appendBitFromByte!0 thiss!1379 (select (arr!1119 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22930 () Bool)

(assert (=> b!22930 (= e!15462 (array_inv!632 (buf!984 thiss!1379)))))

(assert (= (and start!5632 res!19686) b!22922))

(assert (= (and b!22922 res!19687) b!22928))

(assert (= (and b!22928 (not res!19685)) b!22929))

(assert (= (and b!22929 (not res!19682)) b!22923))

(assert (= (and b!22923 res!19688) b!22925))

(assert (= (and b!22923 (not res!19680)) b!22920))

(assert (= (and b!22920 (not res!19689)) b!22921))

(assert (= (and b!22921 (not res!19681)) b!22924))

(assert (= (and b!22924 (not res!19683)) b!22926))

(assert (= (and b!22926 res!19684) b!22927))

(assert (= start!5632 b!22930))

(declare-fun m!32209 () Bool)

(assert (=> b!22930 m!32209))

(declare-fun m!32211 () Bool)

(assert (=> b!22928 m!32211))

(declare-fun m!32213 () Bool)

(assert (=> b!22928 m!32213))

(declare-fun m!32215 () Bool)

(assert (=> b!22928 m!32215))

(declare-fun m!32217 () Bool)

(assert (=> b!22922 m!32217))

(declare-fun m!32219 () Bool)

(assert (=> start!5632 m!32219))

(declare-fun m!32221 () Bool)

(assert (=> start!5632 m!32221))

(declare-fun m!32223 () Bool)

(assert (=> b!22920 m!32223))

(declare-fun m!32225 () Bool)

(assert (=> b!22921 m!32225))

(declare-fun m!32227 () Bool)

(assert (=> b!22923 m!32227))

(declare-fun m!32229 () Bool)

(assert (=> b!22923 m!32229))

(declare-fun m!32231 () Bool)

(assert (=> b!22923 m!32231))

(declare-fun m!32233 () Bool)

(assert (=> b!22923 m!32233))

(declare-fun m!32235 () Bool)

(assert (=> b!22923 m!32235))

(declare-fun m!32237 () Bool)

(assert (=> b!22923 m!32237))

(declare-fun m!32239 () Bool)

(assert (=> b!22923 m!32239))

(declare-fun m!32241 () Bool)

(assert (=> b!22929 m!32241))

(declare-fun m!32243 () Bool)

(assert (=> b!22929 m!32243))

(declare-fun m!32245 () Bool)

(assert (=> b!22929 m!32245))

(assert (=> b!22929 m!32241))

(declare-fun m!32247 () Bool)

(assert (=> b!22929 m!32247))

(declare-fun m!32249 () Bool)

(assert (=> b!22929 m!32249))

(declare-fun m!32251 () Bool)

(assert (=> b!22927 m!32251))

(declare-fun m!32253 () Bool)

(assert (=> b!22925 m!32253))

(assert (=> b!22925 m!32253))

(declare-fun m!32255 () Bool)

(assert (=> b!22925 m!32255))

(declare-fun m!32257 () Bool)

(assert (=> b!22925 m!32257))

(assert (=> b!22925 m!32257))

(declare-fun m!32259 () Bool)

(assert (=> b!22925 m!32259))

(check-sat (not b!22923) (not b!22922) (not b!22928) (not b!22929) (not b!22920) (not b!22930) (not b!22927) (not start!5632) (not b!22925) (not b!22921))
