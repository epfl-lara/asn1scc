; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6910 () Bool)

(assert start!6910)

(declare-fun b!33082 () Bool)

(declare-fun e!21922 () Bool)

(declare-datatypes ((array!1846 0))(
  ( (array!1847 (arr!1290 (Array (_ BitVec 32) (_ BitVec 8))) (size!815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1422 0))(
  ( (BitStream!1423 (buf!1143 array!1846) (currentByte!2510 (_ BitVec 32)) (currentBit!2505 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1422)

(declare-fun array_inv!764 (array!1846) Bool)

(assert (=> b!33082 (= e!21922 (array_inv!764 (buf!1143 thiss!1379)))))

(declare-fun b!33083 () Bool)

(declare-fun e!21925 () Bool)

(assert (=> b!33083 (= e!21925 true)))

(declare-datatypes ((List!412 0))(
  ( (Nil!409) (Cons!408 (h!527 Bool) (t!1162 List!412)) )
))
(declare-fun lt!48772 () List!412)

(declare-fun lt!48785 () List!412)

(declare-fun tail!129 (List!412) List!412)

(assert (=> b!33083 (= lt!48772 (tail!129 lt!48785))))

(declare-datatypes ((tuple2!3374 0))(
  ( (tuple2!3375 (_1!1774 BitStream!1422) (_2!1774 BitStream!1422)) )
))
(declare-fun lt!48778 () tuple2!3374)

(declare-datatypes ((Unit!2485 0))(
  ( (Unit!2486) )
))
(declare-datatypes ((tuple2!3376 0))(
  ( (tuple2!3377 (_1!1775 Unit!2485) (_2!1775 BitStream!1422)) )
))
(declare-fun lt!48780 () tuple2!3376)

(declare-fun lt!48782 () tuple2!3374)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!48774 () Unit!2485)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1422 BitStream!1422 BitStream!1422 BitStream!1422 (_ BitVec 64) List!412) Unit!2485)

(assert (=> b!33083 (= lt!48774 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1775 lt!48780) (_2!1775 lt!48780) (_1!1774 lt!48778) (_1!1774 lt!48782) (bvsub to!314 i!635) lt!48785))))

(declare-fun b!33084 () Bool)

(declare-fun res!28313 () Bool)

(declare-fun e!21917 () Bool)

(assert (=> b!33084 (=> res!28313 e!21917)))

(declare-fun lt!48787 () tuple2!3376)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33084 (= res!28313 (not (invariant!0 (currentBit!2505 (_2!1775 lt!48787)) (currentByte!2510 (_2!1775 lt!48787)) (size!815 (buf!1143 (_2!1775 lt!48780))))))))

(declare-fun b!33085 () Bool)

(declare-fun e!21919 () Bool)

(declare-fun e!21915 () Bool)

(assert (=> b!33085 (= e!21919 (not e!21915))))

(declare-fun res!28311 () Bool)

(assert (=> b!33085 (=> res!28311 e!21915)))

(assert (=> b!33085 (= res!28311 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1422 BitStream!1422) Bool)

(assert (=> b!33085 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48786 () Unit!2485)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1422) Unit!2485)

(assert (=> b!33085 (= lt!48786 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48781 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33085 (= lt!48781 (bitIndex!0 (size!815 (buf!1143 thiss!1379)) (currentByte!2510 thiss!1379) (currentBit!2505 thiss!1379)))))

(declare-fun b!33086 () Bool)

(declare-fun e!21921 () Bool)

(assert (=> b!33086 (= e!21921 e!21917)))

(declare-fun res!28323 () Bool)

(assert (=> b!33086 (=> res!28323 e!21917)))

(assert (=> b!33086 (= res!28323 (not (= (size!815 (buf!1143 (_2!1775 lt!48787))) (size!815 (buf!1143 (_2!1775 lt!48780))))))))

(declare-fun e!21914 () Bool)

(assert (=> b!33086 e!21914))

(declare-fun res!28315 () Bool)

(assert (=> b!33086 (=> (not res!28315) (not e!21914))))

(assert (=> b!33086 (= res!28315 (= (size!815 (buf!1143 (_2!1775 lt!48780))) (size!815 (buf!1143 thiss!1379))))))

(declare-fun b!33087 () Bool)

(declare-fun res!28314 () Bool)

(assert (=> b!33087 (=> res!28314 e!21921)))

(assert (=> b!33087 (= res!28314 (not (invariant!0 (currentBit!2505 (_2!1775 lt!48780)) (currentByte!2510 (_2!1775 lt!48780)) (size!815 (buf!1143 (_2!1775 lt!48780))))))))

(declare-fun res!28319 () Bool)

(assert (=> start!6910 (=> (not res!28319) (not e!21919))))

(declare-fun srcBuffer!2 () array!1846)

(assert (=> start!6910 (= res!28319 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!815 srcBuffer!2))))))))

(assert (=> start!6910 e!21919))

(assert (=> start!6910 true))

(assert (=> start!6910 (array_inv!764 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1422) Bool)

(assert (=> start!6910 (and (inv!12 thiss!1379) e!21922)))

(declare-fun b!33088 () Bool)

(declare-fun e!21923 () Bool)

(assert (=> b!33088 (= e!21915 e!21923)))

(declare-fun res!28317 () Bool)

(assert (=> b!33088 (=> res!28317 e!21923)))

(assert (=> b!33088 (= res!28317 (not (isPrefixOf!0 thiss!1379 (_2!1775 lt!48787))))))

(declare-fun lt!48779 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33088 (validate_offset_bits!1 ((_ sign_extend 32) (size!815 (buf!1143 (_2!1775 lt!48787)))) ((_ sign_extend 32) (currentByte!2510 (_2!1775 lt!48787))) ((_ sign_extend 32) (currentBit!2505 (_2!1775 lt!48787))) lt!48779)))

(assert (=> b!33088 (= lt!48779 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48775 () Unit!2485)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1422 BitStream!1422 (_ BitVec 64) (_ BitVec 64)) Unit!2485)

(assert (=> b!33088 (= lt!48775 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1775 lt!48787) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1422 (_ BitVec 8) (_ BitVec 32)) tuple2!3376)

(assert (=> b!33088 (= lt!48787 (appendBitFromByte!0 thiss!1379 (select (arr!1290 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33089 () Bool)

(declare-fun res!28309 () Bool)

(assert (=> b!33089 (=> res!28309 e!21921)))

(assert (=> b!33089 (= res!28309 (not (= (size!815 (buf!1143 thiss!1379)) (size!815 (buf!1143 (_2!1775 lt!48780))))))))

(declare-fun b!33090 () Bool)

(assert (=> b!33090 (= e!21917 e!21925)))

(declare-fun res!28316 () Bool)

(assert (=> b!33090 (=> res!28316 e!21925)))

(assert (=> b!33090 (= res!28316 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1422 BitStream!1422 (_ BitVec 64)) List!412)

(assert (=> b!33090 (= lt!48772 (bitStreamReadBitsIntoList!0 (_2!1775 lt!48780) (_1!1774 lt!48782) lt!48779))))

(assert (=> b!33090 (= lt!48785 (bitStreamReadBitsIntoList!0 (_2!1775 lt!48780) (_1!1774 lt!48778) (bvsub to!314 i!635)))))

(assert (=> b!33090 (validate_offset_bits!1 ((_ sign_extend 32) (size!815 (buf!1143 (_2!1775 lt!48780)))) ((_ sign_extend 32) (currentByte!2510 (_2!1775 lt!48787))) ((_ sign_extend 32) (currentBit!2505 (_2!1775 lt!48787))) lt!48779)))

(declare-fun lt!48777 () Unit!2485)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1422 array!1846 (_ BitVec 64)) Unit!2485)

(assert (=> b!33090 (= lt!48777 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1775 lt!48787) (buf!1143 (_2!1775 lt!48780)) lt!48779))))

(declare-fun reader!0 (BitStream!1422 BitStream!1422) tuple2!3374)

(assert (=> b!33090 (= lt!48782 (reader!0 (_2!1775 lt!48787) (_2!1775 lt!48780)))))

(assert (=> b!33090 (validate_offset_bits!1 ((_ sign_extend 32) (size!815 (buf!1143 (_2!1775 lt!48780)))) ((_ sign_extend 32) (currentByte!2510 thiss!1379)) ((_ sign_extend 32) (currentBit!2505 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48776 () Unit!2485)

(assert (=> b!33090 (= lt!48776 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1143 (_2!1775 lt!48780)) (bvsub to!314 i!635)))))

(assert (=> b!33090 (= lt!48778 (reader!0 thiss!1379 (_2!1775 lt!48780)))))

(declare-fun b!33091 () Bool)

(declare-fun lt!48773 () (_ BitVec 64))

(assert (=> b!33091 (= e!21914 (= lt!48773 (bvsub (bvsub (bvadd (bitIndex!0 (size!815 (buf!1143 (_2!1775 lt!48787))) (currentByte!2510 (_2!1775 lt!48787)) (currentBit!2505 (_2!1775 lt!48787))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33092 () Bool)

(declare-fun e!21920 () Bool)

(assert (=> b!33092 (= e!21923 e!21920)))

(declare-fun res!28312 () Bool)

(assert (=> b!33092 (=> res!28312 e!21920)))

(assert (=> b!33092 (= res!28312 (not (isPrefixOf!0 (_2!1775 lt!48787) (_2!1775 lt!48780))))))

(assert (=> b!33092 (isPrefixOf!0 thiss!1379 (_2!1775 lt!48780))))

(declare-fun lt!48783 () Unit!2485)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1422 BitStream!1422 BitStream!1422) Unit!2485)

(assert (=> b!33092 (= lt!48783 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1775 lt!48787) (_2!1775 lt!48780)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1422 array!1846 (_ BitVec 64) (_ BitVec 64)) tuple2!3376)

(assert (=> b!33092 (= lt!48780 (appendBitsMSBFirstLoop!0 (_2!1775 lt!48787) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21916 () Bool)

(assert (=> b!33092 e!21916))

(declare-fun res!28310 () Bool)

(assert (=> b!33092 (=> (not res!28310) (not e!21916))))

(assert (=> b!33092 (= res!28310 (validate_offset_bits!1 ((_ sign_extend 32) (size!815 (buf!1143 (_2!1775 lt!48787)))) ((_ sign_extend 32) (currentByte!2510 thiss!1379)) ((_ sign_extend 32) (currentBit!2505 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48771 () Unit!2485)

(assert (=> b!33092 (= lt!48771 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1143 (_2!1775 lt!48787)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48784 () tuple2!3374)

(assert (=> b!33092 (= lt!48784 (reader!0 thiss!1379 (_2!1775 lt!48787)))))

(declare-fun b!33093 () Bool)

(declare-fun res!28320 () Bool)

(assert (=> b!33093 (=> res!28320 e!21925)))

(declare-fun length!138 (List!412) Int)

(assert (=> b!33093 (= res!28320 (<= (length!138 lt!48785) 0))))

(declare-fun b!33094 () Bool)

(declare-fun res!28321 () Bool)

(assert (=> b!33094 (=> res!28321 e!21917)))

(assert (=> b!33094 (= res!28321 (not (invariant!0 (currentBit!2505 (_2!1775 lt!48787)) (currentByte!2510 (_2!1775 lt!48787)) (size!815 (buf!1143 (_2!1775 lt!48787))))))))

(declare-fun b!33095 () Bool)

(declare-fun head!249 (List!412) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1422 array!1846 (_ BitVec 64) (_ BitVec 64)) List!412)

(assert (=> b!33095 (= e!21916 (= (head!249 (byteArrayBitContentToList!0 (_2!1775 lt!48787) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!249 (bitStreamReadBitsIntoList!0 (_2!1775 lt!48787) (_1!1774 lt!48784) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33096 () Bool)

(assert (=> b!33096 (= e!21920 e!21921)))

(declare-fun res!28318 () Bool)

(assert (=> b!33096 (=> res!28318 e!21921)))

(assert (=> b!33096 (= res!28318 (not (= lt!48773 (bvsub (bvadd lt!48781 to!314) i!635))))))

(assert (=> b!33096 (= lt!48773 (bitIndex!0 (size!815 (buf!1143 (_2!1775 lt!48780))) (currentByte!2510 (_2!1775 lt!48780)) (currentBit!2505 (_2!1775 lt!48780))))))

(declare-fun b!33097 () Bool)

(declare-fun res!28322 () Bool)

(assert (=> b!33097 (=> (not res!28322) (not e!21919))))

(assert (=> b!33097 (= res!28322 (validate_offset_bits!1 ((_ sign_extend 32) (size!815 (buf!1143 thiss!1379))) ((_ sign_extend 32) (currentByte!2510 thiss!1379)) ((_ sign_extend 32) (currentBit!2505 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!6910 res!28319) b!33097))

(assert (= (and b!33097 res!28322) b!33085))

(assert (= (and b!33085 (not res!28311)) b!33088))

(assert (= (and b!33088 (not res!28317)) b!33092))

(assert (= (and b!33092 res!28310) b!33095))

(assert (= (and b!33092 (not res!28312)) b!33096))

(assert (= (and b!33096 (not res!28318)) b!33087))

(assert (= (and b!33087 (not res!28314)) b!33089))

(assert (= (and b!33089 (not res!28309)) b!33086))

(assert (= (and b!33086 res!28315) b!33091))

(assert (= (and b!33086 (not res!28323)) b!33094))

(assert (= (and b!33094 (not res!28321)) b!33084))

(assert (= (and b!33084 (not res!28313)) b!33090))

(assert (= (and b!33090 (not res!28316)) b!33093))

(assert (= (and b!33093 (not res!28320)) b!33083))

(assert (= start!6910 b!33082))

(declare-fun m!49017 () Bool)

(assert (=> b!33094 m!49017))

(declare-fun m!49019 () Bool)

(assert (=> b!33090 m!49019))

(declare-fun m!49021 () Bool)

(assert (=> b!33090 m!49021))

(declare-fun m!49023 () Bool)

(assert (=> b!33090 m!49023))

(declare-fun m!49025 () Bool)

(assert (=> b!33090 m!49025))

(declare-fun m!49027 () Bool)

(assert (=> b!33090 m!49027))

(declare-fun m!49029 () Bool)

(assert (=> b!33090 m!49029))

(declare-fun m!49031 () Bool)

(assert (=> b!33090 m!49031))

(declare-fun m!49033 () Bool)

(assert (=> b!33090 m!49033))

(declare-fun m!49035 () Bool)

(assert (=> b!33085 m!49035))

(declare-fun m!49037 () Bool)

(assert (=> b!33085 m!49037))

(declare-fun m!49039 () Bool)

(assert (=> b!33085 m!49039))

(declare-fun m!49041 () Bool)

(assert (=> b!33096 m!49041))

(declare-fun m!49043 () Bool)

(assert (=> b!33093 m!49043))

(declare-fun m!49045 () Bool)

(assert (=> b!33087 m!49045))

(declare-fun m!49047 () Bool)

(assert (=> b!33095 m!49047))

(assert (=> b!33095 m!49047))

(declare-fun m!49049 () Bool)

(assert (=> b!33095 m!49049))

(declare-fun m!49051 () Bool)

(assert (=> b!33095 m!49051))

(assert (=> b!33095 m!49051))

(declare-fun m!49053 () Bool)

(assert (=> b!33095 m!49053))

(declare-fun m!49055 () Bool)

(assert (=> b!33092 m!49055))

(declare-fun m!49057 () Bool)

(assert (=> b!33092 m!49057))

(declare-fun m!49059 () Bool)

(assert (=> b!33092 m!49059))

(declare-fun m!49061 () Bool)

(assert (=> b!33092 m!49061))

(declare-fun m!49063 () Bool)

(assert (=> b!33092 m!49063))

(declare-fun m!49065 () Bool)

(assert (=> b!33092 m!49065))

(declare-fun m!49067 () Bool)

(assert (=> b!33092 m!49067))

(declare-fun m!49069 () Bool)

(assert (=> b!33091 m!49069))

(declare-fun m!49071 () Bool)

(assert (=> b!33083 m!49071))

(declare-fun m!49073 () Bool)

(assert (=> b!33083 m!49073))

(declare-fun m!49075 () Bool)

(assert (=> start!6910 m!49075))

(declare-fun m!49077 () Bool)

(assert (=> start!6910 m!49077))

(declare-fun m!49079 () Bool)

(assert (=> b!33088 m!49079))

(declare-fun m!49081 () Bool)

(assert (=> b!33088 m!49081))

(declare-fun m!49083 () Bool)

(assert (=> b!33088 m!49083))

(declare-fun m!49085 () Bool)

(assert (=> b!33088 m!49085))

(assert (=> b!33088 m!49079))

(declare-fun m!49087 () Bool)

(assert (=> b!33088 m!49087))

(declare-fun m!49089 () Bool)

(assert (=> b!33082 m!49089))

(declare-fun m!49091 () Bool)

(assert (=> b!33084 m!49091))

(declare-fun m!49093 () Bool)

(assert (=> b!33097 m!49093))

(check-sat (not b!33090) (not b!33092) (not b!33096) (not b!33083) (not b!33084) (not b!33094) (not b!33097) (not b!33087) (not b!33095) (not start!6910) (not b!33091) (not b!33085) (not b!33088) (not b!33082) (not b!33093))
