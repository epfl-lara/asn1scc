; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27784 () Bool)

(assert start!27784)

(declare-fun b!143080 () Bool)

(declare-fun e!95292 () Bool)

(declare-fun e!95299 () Bool)

(assert (=> b!143080 (= e!95292 (not e!95299))))

(declare-fun res!119476 () Bool)

(assert (=> b!143080 (=> res!119476 e!95299)))

(declare-datatypes ((array!6541 0))(
  ( (array!6542 (arr!3683 (Array (_ BitVec 32) (_ BitVec 8))) (size!2960 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6541)

(declare-datatypes ((BitStream!5178 0))(
  ( (BitStream!5179 (buf!3389 array!6541) (currentByte!6273 (_ BitVec 32)) (currentBit!6268 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12712 0))(
  ( (tuple2!12713 (_1!6697 BitStream!5178) (_2!6697 array!6541)) )
))
(declare-fun lt!221911 () tuple2!12712)

(declare-datatypes ((tuple2!12714 0))(
  ( (tuple2!12715 (_1!6698 BitStream!5178) (_2!6698 BitStream!5178)) )
))
(declare-fun lt!221916 () tuple2!12714)

(assert (=> b!143080 (= res!119476 (or (not (= (size!2960 (_2!6697 lt!221911)) (size!2960 arr!237))) (not (= (_1!6697 lt!221911) (_2!6698 lt!221916)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5178 array!6541 (_ BitVec 32) (_ BitVec 32)) tuple2!12712)

(assert (=> b!143080 (= lt!221911 (readByteArrayLoopPure!0 (_1!6698 lt!221916) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8920 0))(
  ( (Unit!8921) )
))
(declare-datatypes ((tuple2!12716 0))(
  ( (tuple2!12717 (_1!6699 Unit!8920) (_2!6699 BitStream!5178)) )
))
(declare-fun lt!221908 () tuple2!12716)

(declare-fun lt!221909 () tuple2!12716)

(declare-fun lt!221907 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143080 (validate_offset_bits!1 ((_ sign_extend 32) (size!2960 (buf!3389 (_2!6699 lt!221908)))) ((_ sign_extend 32) (currentByte!6273 (_2!6699 lt!221909))) ((_ sign_extend 32) (currentBit!6268 (_2!6699 lt!221909))) lt!221907)))

(declare-fun lt!221914 () Unit!8920)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5178 array!6541 (_ BitVec 64)) Unit!8920)

(assert (=> b!143080 (= lt!221914 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6699 lt!221909) (buf!3389 (_2!6699 lt!221908)) lt!221907))))

(declare-fun reader!0 (BitStream!5178 BitStream!5178) tuple2!12714)

(assert (=> b!143080 (= lt!221916 (reader!0 (_2!6699 lt!221909) (_2!6699 lt!221908)))))

(declare-fun b!143081 () Bool)

(declare-fun res!119475 () Bool)

(assert (=> b!143081 (=> (not res!119475) (not e!95292))))

(declare-fun isPrefixOf!0 (BitStream!5178 BitStream!5178) Bool)

(assert (=> b!143081 (= res!119475 (isPrefixOf!0 (_2!6699 lt!221909) (_2!6699 lt!221908)))))

(declare-fun e!95300 () Bool)

(declare-datatypes ((tuple2!12718 0))(
  ( (tuple2!12719 (_1!6700 BitStream!5178) (_2!6700 (_ BitVec 8))) )
))
(declare-fun lt!221912 () tuple2!12718)

(declare-fun lt!221915 () tuple2!12714)

(declare-fun b!143082 () Bool)

(assert (=> b!143082 (= e!95300 (and (= (_2!6700 lt!221912) (select (arr!3683 arr!237) from!447)) (= (_1!6700 lt!221912) (_2!6698 lt!221915))))))

(declare-fun readBytePure!0 (BitStream!5178) tuple2!12718)

(assert (=> b!143082 (= lt!221912 (readBytePure!0 (_1!6698 lt!221915)))))

(declare-fun thiss!1634 () BitStream!5178)

(assert (=> b!143082 (= lt!221915 (reader!0 thiss!1634 (_2!6699 lt!221909)))))

(declare-fun b!143083 () Bool)

(declare-fun res!119474 () Bool)

(assert (=> b!143083 (=> (not res!119474) (not e!95300))))

(assert (=> b!143083 (= res!119474 (isPrefixOf!0 thiss!1634 (_2!6699 lt!221909)))))

(declare-fun b!143084 () Bool)

(declare-fun e!95301 () Bool)

(assert (=> b!143084 (= e!95301 e!95292)))

(declare-fun res!119473 () Bool)

(assert (=> b!143084 (=> (not res!119473) (not e!95292))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143084 (= res!119473 (= (bitIndex!0 (size!2960 (buf!3389 (_2!6699 lt!221908))) (currentByte!6273 (_2!6699 lt!221908)) (currentBit!6268 (_2!6699 lt!221908))) (bvadd (bitIndex!0 (size!2960 (buf!3389 (_2!6699 lt!221909))) (currentByte!6273 (_2!6699 lt!221909)) (currentBit!6268 (_2!6699 lt!221909))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221907))))))

(assert (=> b!143084 (= lt!221907 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143085 () Bool)

(declare-fun arrayRangesEq!276 (array!6541 array!6541 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143085 (= e!95299 (not (arrayRangesEq!276 arr!237 (_2!6697 lt!221911) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143086 () Bool)

(declare-fun res!119470 () Bool)

(declare-fun e!95297 () Bool)

(assert (=> b!143086 (=> (not res!119470) (not e!95297))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143086 (= res!119470 (invariant!0 (currentBit!6268 thiss!1634) (currentByte!6273 thiss!1634) (size!2960 (buf!3389 thiss!1634))))))

(declare-fun b!143087 () Bool)

(declare-fun e!95295 () Bool)

(assert (=> b!143087 (= e!95295 (invariant!0 (currentBit!6268 thiss!1634) (currentByte!6273 thiss!1634) (size!2960 (buf!3389 (_2!6699 lt!221909)))))))

(declare-fun b!143088 () Bool)

(declare-fun res!119465 () Bool)

(assert (=> b!143088 (=> (not res!119465) (not e!95297))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143088 (= res!119465 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2960 (buf!3389 thiss!1634))) ((_ sign_extend 32) (currentByte!6273 thiss!1634)) ((_ sign_extend 32) (currentBit!6268 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143089 () Bool)

(declare-fun res!119477 () Bool)

(assert (=> b!143089 (=> (not res!119477) (not e!95300))))

(assert (=> b!143089 (= res!119477 (= (bitIndex!0 (size!2960 (buf!3389 (_2!6699 lt!221909))) (currentByte!6273 (_2!6699 lt!221909)) (currentBit!6268 (_2!6699 lt!221909))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2960 (buf!3389 thiss!1634)) (currentByte!6273 thiss!1634) (currentBit!6268 thiss!1634)))))))

(declare-fun res!119467 () Bool)

(assert (=> start!27784 (=> (not res!119467) (not e!95297))))

(assert (=> start!27784 (= res!119467 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2960 arr!237))))))

(assert (=> start!27784 e!95297))

(assert (=> start!27784 true))

(declare-fun array_inv!2749 (array!6541) Bool)

(assert (=> start!27784 (array_inv!2749 arr!237)))

(declare-fun e!95298 () Bool)

(declare-fun inv!12 (BitStream!5178) Bool)

(assert (=> start!27784 (and (inv!12 thiss!1634) e!95298)))

(declare-fun b!143090 () Bool)

(assert (=> b!143090 (= e!95298 (array_inv!2749 (buf!3389 thiss!1634)))))

(declare-fun b!143091 () Bool)

(declare-fun res!119466 () Bool)

(assert (=> b!143091 (=> (not res!119466) (not e!95297))))

(assert (=> b!143091 (= res!119466 (bvslt from!447 to!404))))

(declare-fun b!143092 () Bool)

(declare-fun e!95294 () Bool)

(declare-fun lt!221913 () tuple2!12718)

(declare-fun lt!221920 () tuple2!12718)

(assert (=> b!143092 (= e!95294 (= (_2!6700 lt!221913) (_2!6700 lt!221920)))))

(declare-fun b!143093 () Bool)

(assert (=> b!143093 (= e!95297 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!221906 () tuple2!12714)

(assert (=> b!143093 (= (_2!6700 (readBytePure!0 (_1!6698 lt!221906))) (select (arr!3683 arr!237) from!447))))

(declare-fun lt!221918 () tuple2!12714)

(assert (=> b!143093 (= lt!221918 (reader!0 (_2!6699 lt!221909) (_2!6699 lt!221908)))))

(assert (=> b!143093 (= lt!221906 (reader!0 thiss!1634 (_2!6699 lt!221908)))))

(assert (=> b!143093 e!95294))

(declare-fun res!119469 () Bool)

(assert (=> b!143093 (=> (not res!119469) (not e!95294))))

(assert (=> b!143093 (= res!119469 (= (bitIndex!0 (size!2960 (buf!3389 (_1!6700 lt!221913))) (currentByte!6273 (_1!6700 lt!221913)) (currentBit!6268 (_1!6700 lt!221913))) (bitIndex!0 (size!2960 (buf!3389 (_1!6700 lt!221920))) (currentByte!6273 (_1!6700 lt!221920)) (currentBit!6268 (_1!6700 lt!221920)))))))

(declare-fun lt!221917 () Unit!8920)

(declare-fun lt!221919 () BitStream!5178)

(declare-fun readBytePrefixLemma!0 (BitStream!5178 BitStream!5178) Unit!8920)

(assert (=> b!143093 (= lt!221917 (readBytePrefixLemma!0 lt!221919 (_2!6699 lt!221908)))))

(assert (=> b!143093 (= lt!221920 (readBytePure!0 (BitStream!5179 (buf!3389 (_2!6699 lt!221908)) (currentByte!6273 thiss!1634) (currentBit!6268 thiss!1634))))))

(assert (=> b!143093 (= lt!221913 (readBytePure!0 lt!221919))))

(assert (=> b!143093 (= lt!221919 (BitStream!5179 (buf!3389 (_2!6699 lt!221909)) (currentByte!6273 thiss!1634) (currentBit!6268 thiss!1634)))))

(assert (=> b!143093 e!95295))

(declare-fun res!119471 () Bool)

(assert (=> b!143093 (=> (not res!119471) (not e!95295))))

(assert (=> b!143093 (= res!119471 (isPrefixOf!0 thiss!1634 (_2!6699 lt!221908)))))

(declare-fun lt!221905 () Unit!8920)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5178 BitStream!5178 BitStream!5178) Unit!8920)

(assert (=> b!143093 (= lt!221905 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6699 lt!221909) (_2!6699 lt!221908)))))

(assert (=> b!143093 e!95301))

(declare-fun res!119472 () Bool)

(assert (=> b!143093 (=> (not res!119472) (not e!95301))))

(assert (=> b!143093 (= res!119472 (= (size!2960 (buf!3389 (_2!6699 lt!221909))) (size!2960 (buf!3389 (_2!6699 lt!221908)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5178 array!6541 (_ BitVec 32) (_ BitVec 32)) tuple2!12716)

(assert (=> b!143093 (= lt!221908 (appendByteArrayLoop!0 (_2!6699 lt!221909) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2960 (buf!3389 (_2!6699 lt!221909)))) ((_ sign_extend 32) (currentByte!6273 (_2!6699 lt!221909))) ((_ sign_extend 32) (currentBit!6268 (_2!6699 lt!221909))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221910 () Unit!8920)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5178 BitStream!5178 (_ BitVec 64) (_ BitVec 32)) Unit!8920)

(assert (=> b!143093 (= lt!221910 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6699 lt!221909) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143093 e!95300))

(declare-fun res!119468 () Bool)

(assert (=> b!143093 (=> (not res!119468) (not e!95300))))

(assert (=> b!143093 (= res!119468 (= (size!2960 (buf!3389 thiss!1634)) (size!2960 (buf!3389 (_2!6699 lt!221909)))))))

(declare-fun appendByte!0 (BitStream!5178 (_ BitVec 8)) tuple2!12716)

(assert (=> b!143093 (= lt!221909 (appendByte!0 thiss!1634 (select (arr!3683 arr!237) from!447)))))

(assert (= (and start!27784 res!119467) b!143088))

(assert (= (and b!143088 res!119465) b!143091))

(assert (= (and b!143091 res!119466) b!143086))

(assert (= (and b!143086 res!119470) b!143093))

(assert (= (and b!143093 res!119468) b!143089))

(assert (= (and b!143089 res!119477) b!143083))

(assert (= (and b!143083 res!119474) b!143082))

(assert (= (and b!143093 res!119472) b!143084))

(assert (= (and b!143084 res!119473) b!143081))

(assert (= (and b!143081 res!119475) b!143080))

(assert (= (and b!143080 (not res!119476)) b!143085))

(assert (= (and b!143093 res!119471) b!143087))

(assert (= (and b!143093 res!119469) b!143092))

(assert (= start!27784 b!143090))

(declare-fun m!219677 () Bool)

(assert (=> b!143093 m!219677))

(declare-fun m!219679 () Bool)

(assert (=> b!143093 m!219679))

(declare-fun m!219681 () Bool)

(assert (=> b!143093 m!219681))

(declare-fun m!219683 () Bool)

(assert (=> b!143093 m!219683))

(declare-fun m!219685 () Bool)

(assert (=> b!143093 m!219685))

(declare-fun m!219687 () Bool)

(assert (=> b!143093 m!219687))

(declare-fun m!219689 () Bool)

(assert (=> b!143093 m!219689))

(declare-fun m!219691 () Bool)

(assert (=> b!143093 m!219691))

(declare-fun m!219693 () Bool)

(assert (=> b!143093 m!219693))

(assert (=> b!143093 m!219691))

(declare-fun m!219695 () Bool)

(assert (=> b!143093 m!219695))

(declare-fun m!219697 () Bool)

(assert (=> b!143093 m!219697))

(declare-fun m!219699 () Bool)

(assert (=> b!143093 m!219699))

(declare-fun m!219701 () Bool)

(assert (=> b!143093 m!219701))

(declare-fun m!219703 () Bool)

(assert (=> b!143093 m!219703))

(declare-fun m!219705 () Bool)

(assert (=> b!143093 m!219705))

(declare-fun m!219707 () Bool)

(assert (=> b!143080 m!219707))

(declare-fun m!219709 () Bool)

(assert (=> b!143080 m!219709))

(declare-fun m!219711 () Bool)

(assert (=> b!143080 m!219711))

(assert (=> b!143080 m!219687))

(declare-fun m!219713 () Bool)

(assert (=> b!143081 m!219713))

(assert (=> b!143082 m!219691))

(declare-fun m!219715 () Bool)

(assert (=> b!143082 m!219715))

(declare-fun m!219717 () Bool)

(assert (=> b!143082 m!219717))

(declare-fun m!219719 () Bool)

(assert (=> b!143086 m!219719))

(declare-fun m!219721 () Bool)

(assert (=> b!143088 m!219721))

(declare-fun m!219723 () Bool)

(assert (=> b!143087 m!219723))

(declare-fun m!219725 () Bool)

(assert (=> b!143089 m!219725))

(declare-fun m!219727 () Bool)

(assert (=> b!143089 m!219727))

(declare-fun m!219729 () Bool)

(assert (=> b!143084 m!219729))

(assert (=> b!143084 m!219725))

(declare-fun m!219731 () Bool)

(assert (=> b!143090 m!219731))

(declare-fun m!219733 () Bool)

(assert (=> b!143085 m!219733))

(declare-fun m!219735 () Bool)

(assert (=> start!27784 m!219735))

(declare-fun m!219737 () Bool)

(assert (=> start!27784 m!219737))

(declare-fun m!219739 () Bool)

(assert (=> b!143083 m!219739))

(check-sat (not b!143086) (not b!143090) (not b!143084) (not b!143081) (not b!143080) (not b!143087) (not b!143083) (not b!143093) (not b!143088) (not b!143089) (not start!27784) (not b!143082) (not b!143085))
(check-sat)
