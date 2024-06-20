; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25506 () Bool)

(assert start!25506)

(declare-fun b!129329 () Bool)

(declare-fun res!107098 () Bool)

(declare-fun e!85730 () Bool)

(assert (=> b!129329 (=> (not res!107098) (not e!85730))))

(declare-datatypes ((array!5991 0))(
  ( (array!5992 (arr!3328 (Array (_ BitVec 32) (_ BitVec 8))) (size!2711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4686 0))(
  ( (BitStream!4687 (buf!3069 array!5991) (currentByte!5830 (_ BitVec 32)) (currentBit!5825 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8027 0))(
  ( (Unit!8028) )
))
(declare-datatypes ((tuple2!11046 0))(
  ( (tuple2!11047 (_1!5820 Unit!8027) (_2!5820 BitStream!4686)) )
))
(declare-fun lt!199965 () tuple2!11046)

(declare-fun lt!199969 () tuple2!11046)

(declare-fun isPrefixOf!0 (BitStream!4686 BitStream!4686) Bool)

(assert (=> b!129329 (= res!107098 (isPrefixOf!0 (_2!5820 lt!199965) (_2!5820 lt!199969)))))

(declare-fun b!129330 () Bool)

(declare-fun res!107104 () Bool)

(declare-fun e!85723 () Bool)

(assert (=> b!129330 (=> res!107104 e!85723)))

(declare-fun lt!199972 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129330 (= res!107104 (bvsgt lt!199972 (bitIndex!0 (size!2711 (buf!3069 (_2!5820 lt!199969))) (currentByte!5830 (_2!5820 lt!199969)) (currentBit!5825 (_2!5820 lt!199969)))))))

(declare-fun b!129331 () Bool)

(declare-fun res!107100 () Bool)

(declare-fun e!85728 () Bool)

(assert (=> b!129331 (=> (not res!107100) (not e!85728))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!129331 (= res!107100 (bvslt from!447 to!404))))

(declare-fun e!85721 () Bool)

(declare-fun arr!237 () array!5991)

(declare-datatypes ((tuple2!11048 0))(
  ( (tuple2!11049 (_1!5821 BitStream!4686) (_2!5821 array!5991)) )
))
(declare-fun lt!199967 () tuple2!11048)

(declare-fun b!129332 () Bool)

(declare-fun arrayRangesEq!114 (array!5991 array!5991 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129332 (= e!85721 (not (arrayRangesEq!114 arr!237 (_2!5821 lt!199967) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129333 () Bool)

(assert (=> b!129333 (= e!85728 (not e!85723))))

(declare-fun res!107101 () Bool)

(assert (=> b!129333 (=> res!107101 e!85723)))

(assert (=> b!129333 (= res!107101 (bvsgt lt!199972 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2711 (buf!3069 (_2!5820 lt!199965)))))))))

(declare-fun thiss!1634 () BitStream!4686)

(assert (=> b!129333 (= lt!199972 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2711 (buf!3069 (_2!5820 lt!199965))) (currentByte!5830 thiss!1634) (currentBit!5825 thiss!1634))))))

(declare-fun e!85727 () Bool)

(assert (=> b!129333 e!85727))

(declare-fun res!107097 () Bool)

(assert (=> b!129333 (=> (not res!107097) (not e!85727))))

(assert (=> b!129333 (= res!107097 (isPrefixOf!0 thiss!1634 (_2!5820 lt!199969)))))

(declare-fun lt!199971 () Unit!8027)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4686 BitStream!4686 BitStream!4686) Unit!8027)

(assert (=> b!129333 (= lt!199971 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5820 lt!199965) (_2!5820 lt!199969)))))

(declare-fun e!85729 () Bool)

(assert (=> b!129333 e!85729))

(declare-fun res!107096 () Bool)

(assert (=> b!129333 (=> (not res!107096) (not e!85729))))

(assert (=> b!129333 (= res!107096 (= (size!2711 (buf!3069 (_2!5820 lt!199965))) (size!2711 (buf!3069 (_2!5820 lt!199969)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4686 array!5991 (_ BitVec 32) (_ BitVec 32)) tuple2!11046)

(assert (=> b!129333 (= lt!199969 (appendByteArrayLoop!0 (_2!5820 lt!199965) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129333 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2711 (buf!3069 (_2!5820 lt!199965)))) ((_ sign_extend 32) (currentByte!5830 (_2!5820 lt!199965))) ((_ sign_extend 32) (currentBit!5825 (_2!5820 lt!199965))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199975 () Unit!8027)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4686 BitStream!4686 (_ BitVec 64) (_ BitVec 32)) Unit!8027)

(assert (=> b!129333 (= lt!199975 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5820 lt!199965) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85722 () Bool)

(assert (=> b!129333 e!85722))

(declare-fun res!107105 () Bool)

(assert (=> b!129333 (=> (not res!107105) (not e!85722))))

(assert (=> b!129333 (= res!107105 (= (size!2711 (buf!3069 thiss!1634)) (size!2711 (buf!3069 (_2!5820 lt!199965)))))))

(declare-fun appendByte!0 (BitStream!4686 (_ BitVec 8)) tuple2!11046)

(assert (=> b!129333 (= lt!199965 (appendByte!0 thiss!1634 (select (arr!3328 arr!237) from!447)))))

(declare-fun b!129334 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129334 (= e!85727 (invariant!0 (currentBit!5825 thiss!1634) (currentByte!5830 thiss!1634) (size!2711 (buf!3069 (_2!5820 lt!199965)))))))

(declare-datatypes ((tuple2!11050 0))(
  ( (tuple2!11051 (_1!5822 BitStream!4686) (_2!5822 BitStream!4686)) )
))
(declare-fun lt!199970 () tuple2!11050)

(declare-fun b!129335 () Bool)

(declare-datatypes ((tuple2!11052 0))(
  ( (tuple2!11053 (_1!5823 BitStream!4686) (_2!5823 (_ BitVec 8))) )
))
(declare-fun lt!199968 () tuple2!11052)

(assert (=> b!129335 (= e!85722 (and (= (_2!5823 lt!199968) (select (arr!3328 arr!237) from!447)) (= (_1!5823 lt!199968) (_2!5822 lt!199970))))))

(declare-fun readBytePure!0 (BitStream!4686) tuple2!11052)

(assert (=> b!129335 (= lt!199968 (readBytePure!0 (_1!5822 lt!199970)))))

(declare-fun reader!0 (BitStream!4686 BitStream!4686) tuple2!11050)

(assert (=> b!129335 (= lt!199970 (reader!0 thiss!1634 (_2!5820 lt!199965)))))

(declare-fun b!129336 () Bool)

(declare-fun res!107103 () Bool)

(assert (=> b!129336 (=> (not res!107103) (not e!85722))))

(assert (=> b!129336 (= res!107103 (isPrefixOf!0 thiss!1634 (_2!5820 lt!199965)))))

(declare-fun b!129337 () Bool)

(assert (=> b!129337 (= e!85723 true)))

(declare-fun lt!199973 () tuple2!11052)

(assert (=> b!129337 (= lt!199973 (readBytePure!0 (BitStream!4687 (buf!3069 (_2!5820 lt!199969)) (currentByte!5830 thiss!1634) (currentBit!5825 thiss!1634))))))

(declare-fun lt!199976 () tuple2!11052)

(assert (=> b!129337 (= lt!199976 (readBytePure!0 (BitStream!4687 (buf!3069 (_2!5820 lt!199965)) (currentByte!5830 thiss!1634) (currentBit!5825 thiss!1634))))))

(declare-fun res!107093 () Bool)

(assert (=> start!25506 (=> (not res!107093) (not e!85728))))

(assert (=> start!25506 (= res!107093 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2711 arr!237))))))

(assert (=> start!25506 e!85728))

(assert (=> start!25506 true))

(declare-fun array_inv!2500 (array!5991) Bool)

(assert (=> start!25506 (array_inv!2500 arr!237)))

(declare-fun e!85726 () Bool)

(declare-fun inv!12 (BitStream!4686) Bool)

(assert (=> start!25506 (and (inv!12 thiss!1634) e!85726)))

(declare-fun b!129338 () Bool)

(assert (=> b!129338 (= e!85726 (array_inv!2500 (buf!3069 thiss!1634)))))

(declare-fun b!129339 () Bool)

(assert (=> b!129339 (= e!85729 e!85730)))

(declare-fun res!107095 () Bool)

(assert (=> b!129339 (=> (not res!107095) (not e!85730))))

(declare-fun lt!199964 () (_ BitVec 64))

(assert (=> b!129339 (= res!107095 (= (bitIndex!0 (size!2711 (buf!3069 (_2!5820 lt!199969))) (currentByte!5830 (_2!5820 lt!199969)) (currentBit!5825 (_2!5820 lt!199969))) (bvadd (bitIndex!0 (size!2711 (buf!3069 (_2!5820 lt!199965))) (currentByte!5830 (_2!5820 lt!199965)) (currentBit!5825 (_2!5820 lt!199965))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199964))))))

(assert (=> b!129339 (= lt!199964 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129340 () Bool)

(declare-fun res!107106 () Bool)

(assert (=> b!129340 (=> (not res!107106) (not e!85722))))

(assert (=> b!129340 (= res!107106 (= (bitIndex!0 (size!2711 (buf!3069 (_2!5820 lt!199965))) (currentByte!5830 (_2!5820 lt!199965)) (currentBit!5825 (_2!5820 lt!199965))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2711 (buf!3069 thiss!1634)) (currentByte!5830 thiss!1634) (currentBit!5825 thiss!1634)))))))

(declare-fun b!129341 () Bool)

(declare-fun res!107099 () Bool)

(assert (=> b!129341 (=> (not res!107099) (not e!85728))))

(assert (=> b!129341 (= res!107099 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2711 (buf!3069 thiss!1634))) ((_ sign_extend 32) (currentByte!5830 thiss!1634)) ((_ sign_extend 32) (currentBit!5825 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129342 () Bool)

(declare-fun res!107102 () Bool)

(assert (=> b!129342 (=> res!107102 e!85723)))

(declare-fun arrayBitRangesEq!0 (array!5991 array!5991 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129342 (= res!107102 (not (arrayBitRangesEq!0 (buf!3069 (_2!5820 lt!199965)) (buf!3069 (_2!5820 lt!199969)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!199972)))))

(declare-fun b!129343 () Bool)

(declare-fun res!107107 () Bool)

(assert (=> b!129343 (=> (not res!107107) (not e!85728))))

(assert (=> b!129343 (= res!107107 (invariant!0 (currentBit!5825 thiss!1634) (currentByte!5830 thiss!1634) (size!2711 (buf!3069 thiss!1634))))))

(declare-fun b!129344 () Bool)

(assert (=> b!129344 (= e!85730 (not e!85721))))

(declare-fun res!107094 () Bool)

(assert (=> b!129344 (=> res!107094 e!85721)))

(declare-fun lt!199974 () tuple2!11050)

(assert (=> b!129344 (= res!107094 (or (not (= (size!2711 (_2!5821 lt!199967)) (size!2711 arr!237))) (not (= (_1!5821 lt!199967) (_2!5822 lt!199974)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4686 array!5991 (_ BitVec 32) (_ BitVec 32)) tuple2!11048)

(assert (=> b!129344 (= lt!199967 (readByteArrayLoopPure!0 (_1!5822 lt!199974) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129344 (validate_offset_bits!1 ((_ sign_extend 32) (size!2711 (buf!3069 (_2!5820 lt!199969)))) ((_ sign_extend 32) (currentByte!5830 (_2!5820 lt!199965))) ((_ sign_extend 32) (currentBit!5825 (_2!5820 lt!199965))) lt!199964)))

(declare-fun lt!199966 () Unit!8027)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4686 array!5991 (_ BitVec 64)) Unit!8027)

(assert (=> b!129344 (= lt!199966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5820 lt!199965) (buf!3069 (_2!5820 lt!199969)) lt!199964))))

(assert (=> b!129344 (= lt!199974 (reader!0 (_2!5820 lt!199965) (_2!5820 lt!199969)))))

(assert (= (and start!25506 res!107093) b!129341))

(assert (= (and b!129341 res!107099) b!129331))

(assert (= (and b!129331 res!107100) b!129343))

(assert (= (and b!129343 res!107107) b!129333))

(assert (= (and b!129333 res!107105) b!129340))

(assert (= (and b!129340 res!107106) b!129336))

(assert (= (and b!129336 res!107103) b!129335))

(assert (= (and b!129333 res!107096) b!129339))

(assert (= (and b!129339 res!107095) b!129329))

(assert (= (and b!129329 res!107098) b!129344))

(assert (= (and b!129344 (not res!107094)) b!129332))

(assert (= (and b!129333 res!107097) b!129334))

(assert (= (and b!129333 (not res!107101)) b!129330))

(assert (= (and b!129330 (not res!107104)) b!129342))

(assert (= (and b!129342 (not res!107102)) b!129337))

(assert (= start!25506 b!129338))

(declare-fun m!195143 () Bool)

(assert (=> b!129338 m!195143))

(declare-fun m!195145 () Bool)

(assert (=> b!129330 m!195145))

(declare-fun m!195147 () Bool)

(assert (=> start!25506 m!195147))

(declare-fun m!195149 () Bool)

(assert (=> start!25506 m!195149))

(declare-fun m!195151 () Bool)

(assert (=> b!129344 m!195151))

(declare-fun m!195153 () Bool)

(assert (=> b!129344 m!195153))

(declare-fun m!195155 () Bool)

(assert (=> b!129344 m!195155))

(declare-fun m!195157 () Bool)

(assert (=> b!129344 m!195157))

(assert (=> b!129339 m!195145))

(declare-fun m!195159 () Bool)

(assert (=> b!129339 m!195159))

(declare-fun m!195161 () Bool)

(assert (=> b!129333 m!195161))

(declare-fun m!195163 () Bool)

(assert (=> b!129333 m!195163))

(declare-fun m!195165 () Bool)

(assert (=> b!129333 m!195165))

(declare-fun m!195167 () Bool)

(assert (=> b!129333 m!195167))

(declare-fun m!195169 () Bool)

(assert (=> b!129333 m!195169))

(declare-fun m!195171 () Bool)

(assert (=> b!129333 m!195171))

(declare-fun m!195173 () Bool)

(assert (=> b!129333 m!195173))

(declare-fun m!195175 () Bool)

(assert (=> b!129333 m!195175))

(assert (=> b!129333 m!195173))

(declare-fun m!195177 () Bool)

(assert (=> b!129332 m!195177))

(assert (=> b!129340 m!195159))

(declare-fun m!195179 () Bool)

(assert (=> b!129340 m!195179))

(declare-fun m!195181 () Bool)

(assert (=> b!129329 m!195181))

(declare-fun m!195183 () Bool)

(assert (=> b!129336 m!195183))

(declare-fun m!195185 () Bool)

(assert (=> b!129341 m!195185))

(assert (=> b!129335 m!195173))

(declare-fun m!195187 () Bool)

(assert (=> b!129335 m!195187))

(declare-fun m!195189 () Bool)

(assert (=> b!129335 m!195189))

(declare-fun m!195191 () Bool)

(assert (=> b!129343 m!195191))

(declare-fun m!195193 () Bool)

(assert (=> b!129337 m!195193))

(declare-fun m!195195 () Bool)

(assert (=> b!129337 m!195195))

(declare-fun m!195197 () Bool)

(assert (=> b!129334 m!195197))

(declare-fun m!195199 () Bool)

(assert (=> b!129342 m!195199))

(check-sat (not b!129342) (not start!25506) (not b!129341) (not b!129329) (not b!129337) (not b!129344) (not b!129335) (not b!129333) (not b!129340) (not b!129338) (not b!129330) (not b!129332) (not b!129336) (not b!129339) (not b!129343) (not b!129334))
