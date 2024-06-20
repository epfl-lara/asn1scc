; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5650 () Bool)

(assert start!5650)

(declare-fun b!23286 () Bool)

(declare-fun res!20027 () Bool)

(declare-fun e!15749 () Bool)

(assert (=> b!23286 (=> res!20027 e!15749)))

(declare-datatypes ((array!1573 0))(
  ( (array!1574 (arr!1128 (Array (_ BitVec 32) (_ BitVec 8))) (size!672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1176 0))(
  ( (BitStream!1177 (buf!993 array!1573) (currentByte!2306 (_ BitVec 32)) (currentBit!2301 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1176)

(declare-datatypes ((Unit!1987 0))(
  ( (Unit!1988) )
))
(declare-datatypes ((tuple2!2670 0))(
  ( (tuple2!2671 (_1!1422 Unit!1987) (_2!1422 BitStream!1176)) )
))
(declare-fun lt!33868 () tuple2!2670)

(assert (=> b!23286 (= res!20027 (not (= (size!672 (buf!993 thiss!1379)) (size!672 (buf!993 (_2!1422 lt!33868))))))))

(declare-fun b!23287 () Bool)

(declare-fun e!15748 () Bool)

(declare-fun e!15750 () Bool)

(assert (=> b!23287 (= e!15748 e!15750)))

(declare-fun res!20028 () Bool)

(assert (=> b!23287 (=> res!20028 e!15750)))

(declare-fun lt!33861 () tuple2!2670)

(declare-fun isPrefixOf!0 (BitStream!1176 BitStream!1176) Bool)

(assert (=> b!23287 (= res!20028 (not (isPrefixOf!0 thiss!1379 (_2!1422 lt!33861))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23287 (validate_offset_bits!1 ((_ sign_extend 32) (size!672 (buf!993 (_2!1422 lt!33861)))) ((_ sign_extend 32) (currentByte!2306 (_2!1422 lt!33861))) ((_ sign_extend 32) (currentBit!2301 (_2!1422 lt!33861))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33864 () Unit!1987)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1176 BitStream!1176 (_ BitVec 64) (_ BitVec 64)) Unit!1987)

(assert (=> b!23287 (= lt!33864 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1422 lt!33861) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1573)

(declare-fun appendBitFromByte!0 (BitStream!1176 (_ BitVec 8) (_ BitVec 32)) tuple2!2670)

(assert (=> b!23287 (= lt!33861 (appendBitFromByte!0 thiss!1379 (select (arr!1128 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23288 () Bool)

(declare-fun e!15752 () Bool)

(assert (=> b!23288 (= e!15749 e!15752)))

(declare-fun res!20031 () Bool)

(assert (=> b!23288 (=> res!20031 e!15752)))

(assert (=> b!23288 (= res!20031 (not (= (size!672 (buf!993 (_2!1422 lt!33861))) (size!672 (buf!993 (_2!1422 lt!33868))))))))

(declare-fun e!15751 () Bool)

(assert (=> b!23288 e!15751))

(declare-fun res!20024 () Bool)

(assert (=> b!23288 (=> (not res!20024) (not e!15751))))

(assert (=> b!23288 (= res!20024 (= (size!672 (buf!993 (_2!1422 lt!33868))) (size!672 (buf!993 thiss!1379))))))

(declare-fun b!23289 () Bool)

(declare-fun res!20019 () Bool)

(assert (=> b!23289 (=> res!20019 e!15752)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23289 (= res!20019 (not (invariant!0 (currentBit!2301 (_2!1422 lt!33861)) (currentByte!2306 (_2!1422 lt!33861)) (size!672 (buf!993 (_2!1422 lt!33861))))))))

(declare-fun b!23290 () Bool)

(declare-fun res!20026 () Bool)

(assert (=> b!23290 (=> res!20026 e!15752)))

(assert (=> b!23290 (= res!20026 (not (invariant!0 (currentBit!2301 (_2!1422 lt!33861)) (currentByte!2306 (_2!1422 lt!33861)) (size!672 (buf!993 (_2!1422 lt!33868))))))))

(declare-fun b!23291 () Bool)

(declare-fun e!15747 () Bool)

(assert (=> b!23291 (= e!15747 (not e!15748))))

(declare-fun res!20022 () Bool)

(assert (=> b!23291 (=> res!20022 e!15748)))

(assert (=> b!23291 (= res!20022 (bvsge i!635 to!314))))

(assert (=> b!23291 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33862 () Unit!1987)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1176) Unit!1987)

(assert (=> b!23291 (= lt!33862 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!33867 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23291 (= lt!33867 (bitIndex!0 (size!672 (buf!993 thiss!1379)) (currentByte!2306 thiss!1379) (currentBit!2301 thiss!1379)))))

(declare-fun e!15757 () Bool)

(declare-datatypes ((tuple2!2672 0))(
  ( (tuple2!2673 (_1!1423 BitStream!1176) (_2!1423 BitStream!1176)) )
))
(declare-fun lt!33866 () tuple2!2672)

(declare-fun b!23292 () Bool)

(declare-datatypes ((List!289 0))(
  ( (Nil!286) (Cons!285 (h!404 Bool) (t!1039 List!289)) )
))
(declare-fun head!126 (List!289) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1176 array!1573 (_ BitVec 64) (_ BitVec 64)) List!289)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1176 BitStream!1176 (_ BitVec 64)) List!289)

(assert (=> b!23292 (= e!15757 (= (head!126 (byteArrayBitContentToList!0 (_2!1422 lt!33861) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!126 (bitStreamReadBitsIntoList!0 (_2!1422 lt!33861) (_1!1423 lt!33866) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23293 () Bool)

(assert (=> b!23293 (= e!15752 true)))

(declare-fun lt!33865 () tuple2!2672)

(declare-fun reader!0 (BitStream!1176 BitStream!1176) tuple2!2672)

(assert (=> b!23293 (= lt!33865 (reader!0 thiss!1379 (_2!1422 lt!33868)))))

(declare-fun b!23294 () Bool)

(declare-fun e!15755 () Bool)

(assert (=> b!23294 (= e!15750 e!15755)))

(declare-fun res!20030 () Bool)

(assert (=> b!23294 (=> res!20030 e!15755)))

(assert (=> b!23294 (= res!20030 (not (isPrefixOf!0 (_2!1422 lt!33861) (_2!1422 lt!33868))))))

(assert (=> b!23294 (isPrefixOf!0 thiss!1379 (_2!1422 lt!33868))))

(declare-fun lt!33859 () Unit!1987)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1176 BitStream!1176 BitStream!1176) Unit!1987)

(assert (=> b!23294 (= lt!33859 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1422 lt!33861) (_2!1422 lt!33868)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1176 array!1573 (_ BitVec 64) (_ BitVec 64)) tuple2!2670)

(assert (=> b!23294 (= lt!33868 (appendBitsMSBFirstLoop!0 (_2!1422 lt!33861) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23294 e!15757))

(declare-fun res!20023 () Bool)

(assert (=> b!23294 (=> (not res!20023) (not e!15757))))

(assert (=> b!23294 (= res!20023 (validate_offset_bits!1 ((_ sign_extend 32) (size!672 (buf!993 (_2!1422 lt!33861)))) ((_ sign_extend 32) (currentByte!2306 thiss!1379)) ((_ sign_extend 32) (currentBit!2301 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33860 () Unit!1987)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1176 array!1573 (_ BitVec 64)) Unit!1987)

(assert (=> b!23294 (= lt!33860 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!993 (_2!1422 lt!33861)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!23294 (= lt!33866 (reader!0 thiss!1379 (_2!1422 lt!33861)))))

(declare-fun res!20025 () Bool)

(assert (=> start!5650 (=> (not res!20025) (not e!15747))))

(assert (=> start!5650 (= res!20025 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!672 srcBuffer!2))))))))

(assert (=> start!5650 e!15747))

(assert (=> start!5650 true))

(declare-fun array_inv!641 (array!1573) Bool)

(assert (=> start!5650 (array_inv!641 srcBuffer!2)))

(declare-fun e!15753 () Bool)

(declare-fun inv!12 (BitStream!1176) Bool)

(assert (=> start!5650 (and (inv!12 thiss!1379) e!15753)))

(declare-fun b!23295 () Bool)

(assert (=> b!23295 (= e!15755 e!15749)))

(declare-fun res!20029 () Bool)

(assert (=> b!23295 (=> res!20029 e!15749)))

(declare-fun lt!33863 () (_ BitVec 64))

(assert (=> b!23295 (= res!20029 (not (= lt!33863 (bvsub (bvadd lt!33867 to!314) i!635))))))

(assert (=> b!23295 (= lt!33863 (bitIndex!0 (size!672 (buf!993 (_2!1422 lt!33868))) (currentByte!2306 (_2!1422 lt!33868)) (currentBit!2301 (_2!1422 lt!33868))))))

(declare-fun b!23296 () Bool)

(assert (=> b!23296 (= e!15753 (array_inv!641 (buf!993 thiss!1379)))))

(declare-fun b!23297 () Bool)

(assert (=> b!23297 (= e!15751 (= lt!33863 (bvsub (bvsub (bvadd (bitIndex!0 (size!672 (buf!993 (_2!1422 lt!33861))) (currentByte!2306 (_2!1422 lt!33861)) (currentBit!2301 (_2!1422 lt!33861))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23298 () Bool)

(declare-fun res!20021 () Bool)

(assert (=> b!23298 (=> res!20021 e!15749)))

(assert (=> b!23298 (= res!20021 (not (invariant!0 (currentBit!2301 (_2!1422 lt!33868)) (currentByte!2306 (_2!1422 lt!33868)) (size!672 (buf!993 (_2!1422 lt!33868))))))))

(declare-fun b!23299 () Bool)

(declare-fun res!20020 () Bool)

(assert (=> b!23299 (=> (not res!20020) (not e!15747))))

(assert (=> b!23299 (= res!20020 (validate_offset_bits!1 ((_ sign_extend 32) (size!672 (buf!993 thiss!1379))) ((_ sign_extend 32) (currentByte!2306 thiss!1379)) ((_ sign_extend 32) (currentBit!2301 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5650 res!20025) b!23299))

(assert (= (and b!23299 res!20020) b!23291))

(assert (= (and b!23291 (not res!20022)) b!23287))

(assert (= (and b!23287 (not res!20028)) b!23294))

(assert (= (and b!23294 res!20023) b!23292))

(assert (= (and b!23294 (not res!20030)) b!23295))

(assert (= (and b!23295 (not res!20029)) b!23298))

(assert (= (and b!23298 (not res!20021)) b!23286))

(assert (= (and b!23286 (not res!20027)) b!23288))

(assert (= (and b!23288 res!20024) b!23297))

(assert (= (and b!23288 (not res!20031)) b!23289))

(assert (= (and b!23289 (not res!20019)) b!23290))

(assert (= (and b!23290 (not res!20026)) b!23293))

(assert (= start!5650 b!23296))

(declare-fun m!32719 () Bool)

(assert (=> b!23296 m!32719))

(declare-fun m!32721 () Bool)

(assert (=> b!23290 m!32721))

(declare-fun m!32723 () Bool)

(assert (=> start!5650 m!32723))

(declare-fun m!32725 () Bool)

(assert (=> start!5650 m!32725))

(declare-fun m!32727 () Bool)

(assert (=> b!23289 m!32727))

(declare-fun m!32729 () Bool)

(assert (=> b!23299 m!32729))

(declare-fun m!32731 () Bool)

(assert (=> b!23293 m!32731))

(declare-fun m!32733 () Bool)

(assert (=> b!23291 m!32733))

(declare-fun m!32735 () Bool)

(assert (=> b!23291 m!32735))

(declare-fun m!32737 () Bool)

(assert (=> b!23291 m!32737))

(declare-fun m!32739 () Bool)

(assert (=> b!23298 m!32739))

(declare-fun m!32741 () Bool)

(assert (=> b!23287 m!32741))

(declare-fun m!32743 () Bool)

(assert (=> b!23287 m!32743))

(declare-fun m!32745 () Bool)

(assert (=> b!23287 m!32745))

(declare-fun m!32747 () Bool)

(assert (=> b!23287 m!32747))

(assert (=> b!23287 m!32743))

(declare-fun m!32749 () Bool)

(assert (=> b!23287 m!32749))

(declare-fun m!32751 () Bool)

(assert (=> b!23295 m!32751))

(declare-fun m!32753 () Bool)

(assert (=> b!23294 m!32753))

(declare-fun m!32755 () Bool)

(assert (=> b!23294 m!32755))

(declare-fun m!32757 () Bool)

(assert (=> b!23294 m!32757))

(declare-fun m!32759 () Bool)

(assert (=> b!23294 m!32759))

(declare-fun m!32761 () Bool)

(assert (=> b!23294 m!32761))

(declare-fun m!32763 () Bool)

(assert (=> b!23294 m!32763))

(declare-fun m!32765 () Bool)

(assert (=> b!23294 m!32765))

(declare-fun m!32767 () Bool)

(assert (=> b!23297 m!32767))

(declare-fun m!32769 () Bool)

(assert (=> b!23292 m!32769))

(assert (=> b!23292 m!32769))

(declare-fun m!32771 () Bool)

(assert (=> b!23292 m!32771))

(declare-fun m!32773 () Bool)

(assert (=> b!23292 m!32773))

(assert (=> b!23292 m!32773))

(declare-fun m!32775 () Bool)

(assert (=> b!23292 m!32775))

(check-sat (not b!23296) (not b!23291) (not b!23297) (not start!5650) (not b!23292) (not b!23299) (not b!23294) (not b!23298) (not b!23293) (not b!23287) (not b!23289) (not b!23290) (not b!23295))
