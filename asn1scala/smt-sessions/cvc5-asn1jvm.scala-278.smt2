; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5648 () Bool)

(assert start!5648)

(declare-fun b!23244 () Bool)

(declare-fun e!15724 () Bool)

(declare-fun e!15719 () Bool)

(assert (=> b!23244 (= e!15724 e!15719)))

(declare-fun res!19991 () Bool)

(assert (=> b!23244 (=> res!19991 e!15719)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!33837 () (_ BitVec 64))

(declare-fun lt!33834 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!23244 (= res!19991 (not (= lt!33834 (bvsub (bvadd lt!33837 to!314) i!635))))))

(declare-datatypes ((array!1571 0))(
  ( (array!1572 (arr!1127 (Array (_ BitVec 32) (_ BitVec 8))) (size!671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1174 0))(
  ( (BitStream!1175 (buf!992 array!1571) (currentByte!2305 (_ BitVec 32)) (currentBit!2300 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1985 0))(
  ( (Unit!1986) )
))
(declare-datatypes ((tuple2!2666 0))(
  ( (tuple2!2667 (_1!1420 Unit!1985) (_2!1420 BitStream!1174)) )
))
(declare-fun lt!33836 () tuple2!2666)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23244 (= lt!33834 (bitIndex!0 (size!671 (buf!992 (_2!1420 lt!33836))) (currentByte!2305 (_2!1420 lt!33836)) (currentBit!2300 (_2!1420 lt!33836))))))

(declare-fun b!23245 () Bool)

(declare-fun res!19986 () Bool)

(declare-fun e!15718 () Bool)

(assert (=> b!23245 (=> (not res!19986) (not e!15718))))

(declare-fun thiss!1379 () BitStream!1174)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23245 (= res!19986 (validate_offset_bits!1 ((_ sign_extend 32) (size!671 (buf!992 thiss!1379))) ((_ sign_extend 32) (currentByte!2305 thiss!1379)) ((_ sign_extend 32) (currentBit!2300 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23246 () Bool)

(declare-fun e!15721 () Bool)

(assert (=> b!23246 (= e!15718 (not e!15721))))

(declare-fun res!19985 () Bool)

(assert (=> b!23246 (=> res!19985 e!15721)))

(assert (=> b!23246 (= res!19985 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1174 BitStream!1174) Bool)

(assert (=> b!23246 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33831 () Unit!1985)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1174) Unit!1985)

(assert (=> b!23246 (= lt!33831 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23246 (= lt!33837 (bitIndex!0 (size!671 (buf!992 thiss!1379)) (currentByte!2305 thiss!1379) (currentBit!2300 thiss!1379)))))

(declare-fun b!23247 () Bool)

(declare-fun e!15722 () Bool)

(declare-fun array_inv!640 (array!1571) Bool)

(assert (=> b!23247 (= e!15722 (array_inv!640 (buf!992 thiss!1379)))))

(declare-fun e!15715 () Bool)

(declare-fun b!23248 () Bool)

(declare-fun lt!33832 () tuple2!2666)

(assert (=> b!23248 (= e!15715 (= lt!33834 (bvsub (bvsub (bvadd (bitIndex!0 (size!671 (buf!992 (_2!1420 lt!33832))) (currentByte!2305 (_2!1420 lt!33832)) (currentBit!2300 (_2!1420 lt!33832))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23249 () Bool)

(declare-fun e!15723 () Bool)

(assert (=> b!23249 (= e!15723 true)))

(declare-datatypes ((tuple2!2668 0))(
  ( (tuple2!2669 (_1!1421 BitStream!1174) (_2!1421 BitStream!1174)) )
))
(declare-fun lt!33838 () tuple2!2668)

(declare-fun reader!0 (BitStream!1174 BitStream!1174) tuple2!2668)

(assert (=> b!23249 (= lt!33838 (reader!0 thiss!1379 (_2!1420 lt!33836)))))

(declare-fun b!23250 () Bool)

(declare-fun e!15717 () Bool)

(assert (=> b!23250 (= e!15721 e!15717)))

(declare-fun res!19983 () Bool)

(assert (=> b!23250 (=> res!19983 e!15717)))

(assert (=> b!23250 (= res!19983 (not (isPrefixOf!0 thiss!1379 (_2!1420 lt!33832))))))

(assert (=> b!23250 (validate_offset_bits!1 ((_ sign_extend 32) (size!671 (buf!992 (_2!1420 lt!33832)))) ((_ sign_extend 32) (currentByte!2305 (_2!1420 lt!33832))) ((_ sign_extend 32) (currentBit!2300 (_2!1420 lt!33832))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33830 () Unit!1985)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1174 BitStream!1174 (_ BitVec 64) (_ BitVec 64)) Unit!1985)

(assert (=> b!23250 (= lt!33830 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1420 lt!33832) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1571)

(declare-fun appendBitFromByte!0 (BitStream!1174 (_ BitVec 8) (_ BitVec 32)) tuple2!2666)

(assert (=> b!23250 (= lt!33832 (appendBitFromByte!0 thiss!1379 (select (arr!1127 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23251 () Bool)

(declare-fun res!19987 () Bool)

(assert (=> b!23251 (=> res!19987 e!15723)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23251 (= res!19987 (not (invariant!0 (currentBit!2300 (_2!1420 lt!33832)) (currentByte!2305 (_2!1420 lt!33832)) (size!671 (buf!992 (_2!1420 lt!33832))))))))

(declare-fun b!23252 () Bool)

(declare-fun res!19992 () Bool)

(assert (=> b!23252 (=> res!19992 e!15719)))

(assert (=> b!23252 (= res!19992 (not (= (size!671 (buf!992 thiss!1379)) (size!671 (buf!992 (_2!1420 lt!33836))))))))

(declare-fun b!23253 () Bool)

(assert (=> b!23253 (= e!15717 e!15724)))

(declare-fun res!19990 () Bool)

(assert (=> b!23253 (=> res!19990 e!15724)))

(assert (=> b!23253 (= res!19990 (not (isPrefixOf!0 (_2!1420 lt!33832) (_2!1420 lt!33836))))))

(assert (=> b!23253 (isPrefixOf!0 thiss!1379 (_2!1420 lt!33836))))

(declare-fun lt!33829 () Unit!1985)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1174 BitStream!1174 BitStream!1174) Unit!1985)

(assert (=> b!23253 (= lt!33829 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1420 lt!33832) (_2!1420 lt!33836)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1174 array!1571 (_ BitVec 64) (_ BitVec 64)) tuple2!2666)

(assert (=> b!23253 (= lt!33836 (appendBitsMSBFirstLoop!0 (_2!1420 lt!33832) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15720 () Bool)

(assert (=> b!23253 e!15720))

(declare-fun res!19988 () Bool)

(assert (=> b!23253 (=> (not res!19988) (not e!15720))))

(assert (=> b!23253 (= res!19988 (validate_offset_bits!1 ((_ sign_extend 32) (size!671 (buf!992 (_2!1420 lt!33832)))) ((_ sign_extend 32) (currentByte!2305 thiss!1379)) ((_ sign_extend 32) (currentBit!2300 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33833 () Unit!1985)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1174 array!1571 (_ BitVec 64)) Unit!1985)

(assert (=> b!23253 (= lt!33833 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!992 (_2!1420 lt!33832)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33835 () tuple2!2668)

(assert (=> b!23253 (= lt!33835 (reader!0 thiss!1379 (_2!1420 lt!33832)))))

(declare-fun b!23254 () Bool)

(declare-datatypes ((List!288 0))(
  ( (Nil!285) (Cons!284 (h!403 Bool) (t!1038 List!288)) )
))
(declare-fun head!125 (List!288) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1174 array!1571 (_ BitVec 64) (_ BitVec 64)) List!288)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1174 BitStream!1174 (_ BitVec 64)) List!288)

(assert (=> b!23254 (= e!15720 (= (head!125 (byteArrayBitContentToList!0 (_2!1420 lt!33832) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!125 (bitStreamReadBitsIntoList!0 (_2!1420 lt!33832) (_1!1421 lt!33835) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23255 () Bool)

(declare-fun res!19981 () Bool)

(assert (=> b!23255 (=> res!19981 e!15719)))

(assert (=> b!23255 (= res!19981 (not (invariant!0 (currentBit!2300 (_2!1420 lt!33836)) (currentByte!2305 (_2!1420 lt!33836)) (size!671 (buf!992 (_2!1420 lt!33836))))))))

(declare-fun res!19980 () Bool)

(assert (=> start!5648 (=> (not res!19980) (not e!15718))))

(assert (=> start!5648 (= res!19980 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!671 srcBuffer!2))))))))

(assert (=> start!5648 e!15718))

(assert (=> start!5648 true))

(assert (=> start!5648 (array_inv!640 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1174) Bool)

(assert (=> start!5648 (and (inv!12 thiss!1379) e!15722)))

(declare-fun b!23256 () Bool)

(assert (=> b!23256 (= e!15719 e!15723)))

(declare-fun res!19984 () Bool)

(assert (=> b!23256 (=> res!19984 e!15723)))

(assert (=> b!23256 (= res!19984 (not (= (size!671 (buf!992 (_2!1420 lt!33832))) (size!671 (buf!992 (_2!1420 lt!33836))))))))

(assert (=> b!23256 e!15715))

(declare-fun res!19989 () Bool)

(assert (=> b!23256 (=> (not res!19989) (not e!15715))))

(assert (=> b!23256 (= res!19989 (= (size!671 (buf!992 (_2!1420 lt!33836))) (size!671 (buf!992 thiss!1379))))))

(declare-fun b!23257 () Bool)

(declare-fun res!19982 () Bool)

(assert (=> b!23257 (=> res!19982 e!15723)))

(assert (=> b!23257 (= res!19982 (not (invariant!0 (currentBit!2300 (_2!1420 lt!33832)) (currentByte!2305 (_2!1420 lt!33832)) (size!671 (buf!992 (_2!1420 lt!33836))))))))

(assert (= (and start!5648 res!19980) b!23245))

(assert (= (and b!23245 res!19986) b!23246))

(assert (= (and b!23246 (not res!19985)) b!23250))

(assert (= (and b!23250 (not res!19983)) b!23253))

(assert (= (and b!23253 res!19988) b!23254))

(assert (= (and b!23253 (not res!19990)) b!23244))

(assert (= (and b!23244 (not res!19991)) b!23255))

(assert (= (and b!23255 (not res!19981)) b!23252))

(assert (= (and b!23252 (not res!19992)) b!23256))

(assert (= (and b!23256 res!19989) b!23248))

(assert (= (and b!23256 (not res!19984)) b!23251))

(assert (= (and b!23251 (not res!19987)) b!23257))

(assert (= (and b!23257 (not res!19982)) b!23249))

(assert (= start!5648 b!23247))

(declare-fun m!32661 () Bool)

(assert (=> b!23251 m!32661))

(declare-fun m!32663 () Bool)

(assert (=> b!23245 m!32663))

(declare-fun m!32665 () Bool)

(assert (=> b!23254 m!32665))

(assert (=> b!23254 m!32665))

(declare-fun m!32667 () Bool)

(assert (=> b!23254 m!32667))

(declare-fun m!32669 () Bool)

(assert (=> b!23254 m!32669))

(assert (=> b!23254 m!32669))

(declare-fun m!32671 () Bool)

(assert (=> b!23254 m!32671))

(declare-fun m!32673 () Bool)

(assert (=> start!5648 m!32673))

(declare-fun m!32675 () Bool)

(assert (=> start!5648 m!32675))

(declare-fun m!32677 () Bool)

(assert (=> b!23253 m!32677))

(declare-fun m!32679 () Bool)

(assert (=> b!23253 m!32679))

(declare-fun m!32681 () Bool)

(assert (=> b!23253 m!32681))

(declare-fun m!32683 () Bool)

(assert (=> b!23253 m!32683))

(declare-fun m!32685 () Bool)

(assert (=> b!23253 m!32685))

(declare-fun m!32687 () Bool)

(assert (=> b!23253 m!32687))

(declare-fun m!32689 () Bool)

(assert (=> b!23253 m!32689))

(declare-fun m!32691 () Bool)

(assert (=> b!23250 m!32691))

(declare-fun m!32693 () Bool)

(assert (=> b!23250 m!32693))

(declare-fun m!32695 () Bool)

(assert (=> b!23250 m!32695))

(declare-fun m!32697 () Bool)

(assert (=> b!23250 m!32697))

(assert (=> b!23250 m!32693))

(declare-fun m!32699 () Bool)

(assert (=> b!23250 m!32699))

(declare-fun m!32701 () Bool)

(assert (=> b!23257 m!32701))

(declare-fun m!32703 () Bool)

(assert (=> b!23248 m!32703))

(declare-fun m!32705 () Bool)

(assert (=> b!23244 m!32705))

(declare-fun m!32707 () Bool)

(assert (=> b!23246 m!32707))

(declare-fun m!32709 () Bool)

(assert (=> b!23246 m!32709))

(declare-fun m!32711 () Bool)

(assert (=> b!23246 m!32711))

(declare-fun m!32713 () Bool)

(assert (=> b!23247 m!32713))

(declare-fun m!32715 () Bool)

(assert (=> b!23249 m!32715))

(declare-fun m!32717 () Bool)

(assert (=> b!23255 m!32717))

(push 1)

