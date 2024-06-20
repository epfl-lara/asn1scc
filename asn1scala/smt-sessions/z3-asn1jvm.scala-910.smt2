; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25536 () Bool)

(assert start!25536)

(declare-fun b!130021 () Bool)

(declare-fun e!86174 () Bool)

(declare-datatypes ((array!6021 0))(
  ( (array!6022 (arr!3343 (Array (_ BitVec 32) (_ BitVec 8))) (size!2726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4716 0))(
  ( (BitStream!4717 (buf!3084 array!6021) (currentByte!5845 (_ BitVec 32)) (currentBit!5840 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4716)

(declare-fun array_inv!2515 (array!6021) Bool)

(assert (=> b!130021 (= e!86174 (array_inv!2515 (buf!3084 thiss!1634)))))

(declare-datatypes ((tuple2!11166 0))(
  ( (tuple2!11167 (_1!5880 BitStream!4716) (_2!5880 array!6021)) )
))
(declare-fun lt!200574 () tuple2!11166)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!130022 () Bool)

(declare-fun arr!237 () array!6021)

(declare-fun e!86173 () Bool)

(declare-fun arrayRangesEq!129 (array!6021 array!6021 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130022 (= e!86173 (not (arrayRangesEq!129 arr!237 (_2!5880 lt!200574) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130023 () Bool)

(declare-fun e!86178 () Bool)

(assert (=> b!130023 (= e!86178 (not e!86173))))

(declare-fun res!107741 () Bool)

(assert (=> b!130023 (=> res!107741 e!86173)))

(declare-datatypes ((tuple2!11168 0))(
  ( (tuple2!11169 (_1!5881 BitStream!4716) (_2!5881 BitStream!4716)) )
))
(declare-fun lt!200571 () tuple2!11168)

(assert (=> b!130023 (= res!107741 (or (not (= (size!2726 (_2!5880 lt!200574)) (size!2726 arr!237))) (not (= (_1!5880 lt!200574) (_2!5881 lt!200571)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4716 array!6021 (_ BitVec 32) (_ BitVec 32)) tuple2!11166)

(assert (=> b!130023 (= lt!200574 (readByteArrayLoopPure!0 (_1!5881 lt!200571) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8057 0))(
  ( (Unit!8058) )
))
(declare-datatypes ((tuple2!11170 0))(
  ( (tuple2!11171 (_1!5882 Unit!8057) (_2!5882 BitStream!4716)) )
))
(declare-fun lt!200579 () tuple2!11170)

(declare-fun lt!200572 () tuple2!11170)

(declare-fun lt!200580 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130023 (validate_offset_bits!1 ((_ sign_extend 32) (size!2726 (buf!3084 (_2!5882 lt!200579)))) ((_ sign_extend 32) (currentByte!5845 (_2!5882 lt!200572))) ((_ sign_extend 32) (currentBit!5840 (_2!5882 lt!200572))) lt!200580)))

(declare-fun lt!200569 () Unit!8057)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4716 array!6021 (_ BitVec 64)) Unit!8057)

(assert (=> b!130023 (= lt!200569 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5882 lt!200572) (buf!3084 (_2!5882 lt!200579)) lt!200580))))

(declare-fun reader!0 (BitStream!4716 BitStream!4716) tuple2!11168)

(assert (=> b!130023 (= lt!200571 (reader!0 (_2!5882 lt!200572) (_2!5882 lt!200579)))))

(declare-fun b!130024 () Bool)

(declare-fun res!107751 () Bool)

(declare-fun e!86180 () Bool)

(assert (=> b!130024 (=> (not res!107751) (not e!86180))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130024 (= res!107751 (invariant!0 (currentBit!5840 thiss!1634) (currentByte!5845 thiss!1634) (size!2726 (buf!3084 thiss!1634))))))

(declare-fun b!130025 () Bool)

(declare-fun e!86171 () Bool)

(assert (=> b!130025 (= e!86171 (invariant!0 (currentBit!5840 thiss!1634) (currentByte!5845 thiss!1634) (size!2726 (buf!3084 (_2!5882 lt!200572)))))))

(declare-fun b!130026 () Bool)

(declare-fun res!107749 () Bool)

(assert (=> b!130026 (=> (not res!107749) (not e!86180))))

(assert (=> b!130026 (= res!107749 (bvslt from!447 to!404))))

(declare-fun res!107742 () Bool)

(assert (=> start!25536 (=> (not res!107742) (not e!86180))))

(assert (=> start!25536 (= res!107742 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2726 arr!237))))))

(assert (=> start!25536 e!86180))

(assert (=> start!25536 true))

(assert (=> start!25536 (array_inv!2515 arr!237)))

(declare-fun inv!12 (BitStream!4716) Bool)

(assert (=> start!25536 (and (inv!12 thiss!1634) e!86174)))

(declare-fun b!130027 () Bool)

(declare-fun e!86177 () Bool)

(assert (=> b!130027 (= e!86177 e!86178)))

(declare-fun res!107745 () Bool)

(assert (=> b!130027 (=> (not res!107745) (not e!86178))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130027 (= res!107745 (= (bitIndex!0 (size!2726 (buf!3084 (_2!5882 lt!200579))) (currentByte!5845 (_2!5882 lt!200579)) (currentBit!5840 (_2!5882 lt!200579))) (bvadd (bitIndex!0 (size!2726 (buf!3084 (_2!5882 lt!200572))) (currentByte!5845 (_2!5882 lt!200572)) (currentBit!5840 (_2!5882 lt!200572))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200580))))))

(assert (=> b!130027 (= lt!200580 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130028 () Bool)

(declare-fun res!107747 () Bool)

(assert (=> b!130028 (=> (not res!107747) (not e!86178))))

(declare-fun isPrefixOf!0 (BitStream!4716 BitStream!4716) Bool)

(assert (=> b!130028 (= res!107747 (isPrefixOf!0 (_2!5882 lt!200572) (_2!5882 lt!200579)))))

(declare-fun b!130029 () Bool)

(declare-fun res!107746 () Bool)

(assert (=> b!130029 (=> (not res!107746) (not e!86180))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130029 (= res!107746 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2726 (buf!3084 thiss!1634))) ((_ sign_extend 32) (currentByte!5845 thiss!1634)) ((_ sign_extend 32) (currentBit!5840 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130030 () Bool)

(declare-fun e!86175 () Bool)

(declare-datatypes ((tuple2!11172 0))(
  ( (tuple2!11173 (_1!5883 BitStream!4716) (_2!5883 (_ BitVec 8))) )
))
(declare-fun lt!200577 () tuple2!11172)

(declare-fun lt!200570 () tuple2!11172)

(assert (=> b!130030 (= e!86175 (= (_2!5883 lt!200577) (_2!5883 lt!200570)))))

(declare-fun lt!200582 () tuple2!11168)

(declare-fun lt!200575 () tuple2!11172)

(declare-fun b!130031 () Bool)

(declare-fun e!86176 () Bool)

(assert (=> b!130031 (= e!86176 (and (= (_2!5883 lt!200575) (select (arr!3343 arr!237) from!447)) (= (_1!5883 lt!200575) (_2!5881 lt!200582))))))

(declare-fun readBytePure!0 (BitStream!4716) tuple2!11172)

(assert (=> b!130031 (= lt!200575 (readBytePure!0 (_1!5881 lt!200582)))))

(assert (=> b!130031 (= lt!200582 (reader!0 thiss!1634 (_2!5882 lt!200572)))))

(declare-fun b!130032 () Bool)

(declare-fun res!107740 () Bool)

(assert (=> b!130032 (=> (not res!107740) (not e!86176))))

(assert (=> b!130032 (= res!107740 (= (bitIndex!0 (size!2726 (buf!3084 (_2!5882 lt!200572))) (currentByte!5845 (_2!5882 lt!200572)) (currentBit!5840 (_2!5882 lt!200572))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2726 (buf!3084 thiss!1634)) (currentByte!5845 thiss!1634) (currentBit!5840 thiss!1634)))))))

(declare-fun b!130033 () Bool)

(declare-fun res!107744 () Bool)

(assert (=> b!130033 (=> (not res!107744) (not e!86176))))

(assert (=> b!130033 (= res!107744 (isPrefixOf!0 thiss!1634 (_2!5882 lt!200572)))))

(declare-fun b!130034 () Bool)

(assert (=> b!130034 (= e!86180 (not (isPrefixOf!0 (_2!5882 lt!200572) (_2!5882 lt!200579))))))

(declare-fun lt!200576 () tuple2!11168)

(assert (=> b!130034 (= lt!200576 (reader!0 thiss!1634 (_2!5882 lt!200579)))))

(assert (=> b!130034 e!86175))

(declare-fun res!107748 () Bool)

(assert (=> b!130034 (=> (not res!107748) (not e!86175))))

(assert (=> b!130034 (= res!107748 (= (bitIndex!0 (size!2726 (buf!3084 (_1!5883 lt!200577))) (currentByte!5845 (_1!5883 lt!200577)) (currentBit!5840 (_1!5883 lt!200577))) (bitIndex!0 (size!2726 (buf!3084 (_1!5883 lt!200570))) (currentByte!5845 (_1!5883 lt!200570)) (currentBit!5840 (_1!5883 lt!200570)))))))

(declare-fun lt!200568 () Unit!8057)

(declare-fun lt!200573 () BitStream!4716)

(declare-fun readBytePrefixLemma!0 (BitStream!4716 BitStream!4716) Unit!8057)

(assert (=> b!130034 (= lt!200568 (readBytePrefixLemma!0 lt!200573 (_2!5882 lt!200579)))))

(assert (=> b!130034 (= lt!200570 (readBytePure!0 (BitStream!4717 (buf!3084 (_2!5882 lt!200579)) (currentByte!5845 thiss!1634) (currentBit!5840 thiss!1634))))))

(assert (=> b!130034 (= lt!200577 (readBytePure!0 lt!200573))))

(assert (=> b!130034 (= lt!200573 (BitStream!4717 (buf!3084 (_2!5882 lt!200572)) (currentByte!5845 thiss!1634) (currentBit!5840 thiss!1634)))))

(assert (=> b!130034 e!86171))

(declare-fun res!107752 () Bool)

(assert (=> b!130034 (=> (not res!107752) (not e!86171))))

(assert (=> b!130034 (= res!107752 (isPrefixOf!0 thiss!1634 (_2!5882 lt!200579)))))

(declare-fun lt!200578 () Unit!8057)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4716 BitStream!4716 BitStream!4716) Unit!8057)

(assert (=> b!130034 (= lt!200578 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5882 lt!200572) (_2!5882 lt!200579)))))

(assert (=> b!130034 e!86177))

(declare-fun res!107750 () Bool)

(assert (=> b!130034 (=> (not res!107750) (not e!86177))))

(assert (=> b!130034 (= res!107750 (= (size!2726 (buf!3084 (_2!5882 lt!200572))) (size!2726 (buf!3084 (_2!5882 lt!200579)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4716 array!6021 (_ BitVec 32) (_ BitVec 32)) tuple2!11170)

(assert (=> b!130034 (= lt!200579 (appendByteArrayLoop!0 (_2!5882 lt!200572) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130034 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2726 (buf!3084 (_2!5882 lt!200572)))) ((_ sign_extend 32) (currentByte!5845 (_2!5882 lt!200572))) ((_ sign_extend 32) (currentBit!5840 (_2!5882 lt!200572))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200581 () Unit!8057)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4716 BitStream!4716 (_ BitVec 64) (_ BitVec 32)) Unit!8057)

(assert (=> b!130034 (= lt!200581 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5882 lt!200572) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130034 e!86176))

(declare-fun res!107743 () Bool)

(assert (=> b!130034 (=> (not res!107743) (not e!86176))))

(assert (=> b!130034 (= res!107743 (= (size!2726 (buf!3084 thiss!1634)) (size!2726 (buf!3084 (_2!5882 lt!200572)))))))

(declare-fun appendByte!0 (BitStream!4716 (_ BitVec 8)) tuple2!11170)

(assert (=> b!130034 (= lt!200572 (appendByte!0 thiss!1634 (select (arr!3343 arr!237) from!447)))))

(assert (= (and start!25536 res!107742) b!130029))

(assert (= (and b!130029 res!107746) b!130026))

(assert (= (and b!130026 res!107749) b!130024))

(assert (= (and b!130024 res!107751) b!130034))

(assert (= (and b!130034 res!107743) b!130032))

(assert (= (and b!130032 res!107740) b!130033))

(assert (= (and b!130033 res!107744) b!130031))

(assert (= (and b!130034 res!107750) b!130027))

(assert (= (and b!130027 res!107745) b!130028))

(assert (= (and b!130028 res!107747) b!130023))

(assert (= (and b!130023 (not res!107741)) b!130022))

(assert (= (and b!130034 res!107752) b!130025))

(assert (= (and b!130034 res!107748) b!130030))

(assert (= start!25536 b!130021))

(declare-fun m!196023 () Bool)

(assert (=> b!130028 m!196023))

(declare-fun m!196025 () Bool)

(assert (=> b!130024 m!196025))

(declare-fun m!196027 () Bool)

(assert (=> b!130029 m!196027))

(declare-fun m!196029 () Bool)

(assert (=> b!130027 m!196029))

(declare-fun m!196031 () Bool)

(assert (=> b!130027 m!196031))

(declare-fun m!196033 () Bool)

(assert (=> b!130031 m!196033))

(declare-fun m!196035 () Bool)

(assert (=> b!130031 m!196035))

(declare-fun m!196037 () Bool)

(assert (=> b!130031 m!196037))

(declare-fun m!196039 () Bool)

(assert (=> b!130022 m!196039))

(assert (=> b!130032 m!196031))

(declare-fun m!196041 () Bool)

(assert (=> b!130032 m!196041))

(declare-fun m!196043 () Bool)

(assert (=> start!25536 m!196043))

(declare-fun m!196045 () Bool)

(assert (=> start!25536 m!196045))

(declare-fun m!196047 () Bool)

(assert (=> b!130033 m!196047))

(declare-fun m!196049 () Bool)

(assert (=> b!130021 m!196049))

(declare-fun m!196051 () Bool)

(assert (=> b!130034 m!196051))

(declare-fun m!196053 () Bool)

(assert (=> b!130034 m!196053))

(declare-fun m!196055 () Bool)

(assert (=> b!130034 m!196055))

(declare-fun m!196057 () Bool)

(assert (=> b!130034 m!196057))

(declare-fun m!196059 () Bool)

(assert (=> b!130034 m!196059))

(declare-fun m!196061 () Bool)

(assert (=> b!130034 m!196061))

(declare-fun m!196063 () Bool)

(assert (=> b!130034 m!196063))

(declare-fun m!196065 () Bool)

(assert (=> b!130034 m!196065))

(declare-fun m!196067 () Bool)

(assert (=> b!130034 m!196067))

(declare-fun m!196069 () Bool)

(assert (=> b!130034 m!196069))

(declare-fun m!196071 () Bool)

(assert (=> b!130034 m!196071))

(assert (=> b!130034 m!196023))

(assert (=> b!130034 m!196033))

(declare-fun m!196073 () Bool)

(assert (=> b!130034 m!196073))

(assert (=> b!130034 m!196033))

(declare-fun m!196075 () Bool)

(assert (=> b!130025 m!196075))

(declare-fun m!196077 () Bool)

(assert (=> b!130023 m!196077))

(declare-fun m!196079 () Bool)

(assert (=> b!130023 m!196079))

(declare-fun m!196081 () Bool)

(assert (=> b!130023 m!196081))

(declare-fun m!196083 () Bool)

(assert (=> b!130023 m!196083))

(check-sat (not b!130028) (not start!25536) (not b!130023) (not b!130027) (not b!130022) (not b!130033) (not b!130032) (not b!130031) (not b!130025) (not b!130021) (not b!130034) (not b!130029) (not b!130024))
