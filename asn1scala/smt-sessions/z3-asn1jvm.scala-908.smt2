; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25524 () Bool)

(assert start!25524)

(declare-fun b!129761 () Bool)

(declare-fun res!107508 () Bool)

(declare-fun e!85994 () Bool)

(assert (=> b!129761 (=> (not res!107508) (not e!85994))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6009 0))(
  ( (array!6010 (arr!3337 (Array (_ BitVec 32) (_ BitVec 8))) (size!2720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4704 0))(
  ( (BitStream!4705 (buf!3078 array!6009) (currentByte!5839 (_ BitVec 32)) (currentBit!5834 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4704)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129761 (= res!107508 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2720 (buf!3078 thiss!1634))) ((_ sign_extend 32) (currentByte!5839 thiss!1634)) ((_ sign_extend 32) (currentBit!5834 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!11118 0))(
  ( (tuple2!11119 (_1!5856 BitStream!4704) (_2!5856 array!6009)) )
))
(declare-fun lt!200319 () tuple2!11118)

(declare-fun arr!237 () array!6009)

(declare-fun e!85995 () Bool)

(declare-fun b!129762 () Bool)

(declare-fun arrayRangesEq!123 (array!6009 array!6009 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129762 (= e!85995 (not (arrayRangesEq!123 arr!237 (_2!5856 lt!200319) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129763 () Bool)

(declare-fun res!107512 () Bool)

(declare-fun e!85992 () Bool)

(assert (=> b!129763 (=> (not res!107512) (not e!85992))))

(declare-datatypes ((Unit!8045 0))(
  ( (Unit!8046) )
))
(declare-datatypes ((tuple2!11120 0))(
  ( (tuple2!11121 (_1!5857 Unit!8045) (_2!5857 BitStream!4704)) )
))
(declare-fun lt!200320 () tuple2!11120)

(declare-fun isPrefixOf!0 (BitStream!4704 BitStream!4704) Bool)

(assert (=> b!129763 (= res!107512 (isPrefixOf!0 thiss!1634 (_2!5857 lt!200320)))))

(declare-datatypes ((tuple2!11122 0))(
  ( (tuple2!11123 (_1!5858 BitStream!4704) (_2!5858 BitStream!4704)) )
))
(declare-fun lt!200324 () tuple2!11122)

(declare-fun b!129764 () Bool)

(declare-datatypes ((tuple2!11124 0))(
  ( (tuple2!11125 (_1!5859 BitStream!4704) (_2!5859 (_ BitVec 8))) )
))
(declare-fun lt!200325 () tuple2!11124)

(assert (=> b!129764 (= e!85992 (and (= (_2!5859 lt!200325) (select (arr!3337 arr!237) from!447)) (= (_1!5859 lt!200325) (_2!5858 lt!200324))))))

(declare-fun readBytePure!0 (BitStream!4704) tuple2!11124)

(assert (=> b!129764 (= lt!200325 (readBytePure!0 (_1!5858 lt!200324)))))

(declare-fun reader!0 (BitStream!4704 BitStream!4704) tuple2!11122)

(assert (=> b!129764 (= lt!200324 (reader!0 thiss!1634 (_2!5857 lt!200320)))))

(declare-fun b!129765 () Bool)

(declare-fun res!107509 () Bool)

(declare-fun e!85999 () Bool)

(assert (=> b!129765 (=> res!107509 e!85999)))

(declare-fun lt!200316 () (_ BitVec 64))

(declare-fun lt!200321 () tuple2!11120)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129765 (= res!107509 (bvsgt lt!200316 (bitIndex!0 (size!2720 (buf!3078 (_2!5857 lt!200321))) (currentByte!5839 (_2!5857 lt!200321)) (currentBit!5834 (_2!5857 lt!200321)))))))

(declare-fun b!129767 () Bool)

(declare-fun res!107501 () Bool)

(assert (=> b!129767 (=> res!107501 e!85999)))

(declare-fun arrayBitRangesEq!0 (array!6009 array!6009 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129767 (= res!107501 (not (arrayBitRangesEq!0 (buf!3078 (_2!5857 lt!200320)) (buf!3078 (_2!5857 lt!200321)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200316)))))

(declare-fun b!129768 () Bool)

(declare-fun res!107506 () Bool)

(assert (=> b!129768 (=> (not res!107506) (not e!85994))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129768 (= res!107506 (invariant!0 (currentBit!5834 thiss!1634) (currentByte!5839 thiss!1634) (size!2720 (buf!3078 thiss!1634))))))

(declare-fun b!129769 () Bool)

(assert (=> b!129769 (= e!85994 (not e!85999))))

(declare-fun res!107502 () Bool)

(assert (=> b!129769 (=> res!107502 e!85999)))

(assert (=> b!129769 (= res!107502 (bvsgt lt!200316 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2720 (buf!3078 (_2!5857 lt!200320)))))))))

(assert (=> b!129769 (= lt!200316 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2720 (buf!3078 (_2!5857 lt!200320))) (currentByte!5839 thiss!1634) (currentBit!5834 thiss!1634))))))

(declare-fun e!85991 () Bool)

(assert (=> b!129769 e!85991))

(declare-fun res!107499 () Bool)

(assert (=> b!129769 (=> (not res!107499) (not e!85991))))

(assert (=> b!129769 (= res!107499 (isPrefixOf!0 thiss!1634 (_2!5857 lt!200321)))))

(declare-fun lt!200327 () Unit!8045)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4704 BitStream!4704 BitStream!4704) Unit!8045)

(assert (=> b!129769 (= lt!200327 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5857 lt!200320) (_2!5857 lt!200321)))))

(declare-fun e!86000 () Bool)

(assert (=> b!129769 e!86000))

(declare-fun res!107500 () Bool)

(assert (=> b!129769 (=> (not res!107500) (not e!86000))))

(assert (=> b!129769 (= res!107500 (= (size!2720 (buf!3078 (_2!5857 lt!200320))) (size!2720 (buf!3078 (_2!5857 lt!200321)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4704 array!6009 (_ BitVec 32) (_ BitVec 32)) tuple2!11120)

(assert (=> b!129769 (= lt!200321 (appendByteArrayLoop!0 (_2!5857 lt!200320) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129769 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2720 (buf!3078 (_2!5857 lt!200320)))) ((_ sign_extend 32) (currentByte!5839 (_2!5857 lt!200320))) ((_ sign_extend 32) (currentBit!5834 (_2!5857 lt!200320))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200323 () Unit!8045)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4704 BitStream!4704 (_ BitVec 64) (_ BitVec 32)) Unit!8045)

(assert (=> b!129769 (= lt!200323 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5857 lt!200320) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129769 e!85992))

(declare-fun res!107507 () Bool)

(assert (=> b!129769 (=> (not res!107507) (not e!85992))))

(assert (=> b!129769 (= res!107507 (= (size!2720 (buf!3078 thiss!1634)) (size!2720 (buf!3078 (_2!5857 lt!200320)))))))

(declare-fun appendByte!0 (BitStream!4704 (_ BitVec 8)) tuple2!11120)

(assert (=> b!129769 (= lt!200320 (appendByte!0 thiss!1634 (select (arr!3337 arr!237) from!447)))))

(declare-fun b!129770 () Bool)

(declare-fun res!107505 () Bool)

(assert (=> b!129770 (=> (not res!107505) (not e!85992))))

(assert (=> b!129770 (= res!107505 (= (bitIndex!0 (size!2720 (buf!3078 (_2!5857 lt!200320))) (currentByte!5839 (_2!5857 lt!200320)) (currentBit!5834 (_2!5857 lt!200320))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2720 (buf!3078 thiss!1634)) (currentByte!5839 thiss!1634) (currentBit!5834 thiss!1634)))))))

(declare-fun b!129771 () Bool)

(declare-fun e!85998 () Bool)

(declare-fun array_inv!2509 (array!6009) Bool)

(assert (=> b!129771 (= e!85998 (array_inv!2509 (buf!3078 thiss!1634)))))

(declare-fun b!129772 () Bool)

(declare-fun res!107498 () Bool)

(declare-fun e!85993 () Bool)

(assert (=> b!129772 (=> (not res!107498) (not e!85993))))

(assert (=> b!129772 (= res!107498 (isPrefixOf!0 (_2!5857 lt!200320) (_2!5857 lt!200321)))))

(declare-fun b!129773 () Bool)

(declare-fun res!107503 () Bool)

(assert (=> b!129773 (=> (not res!107503) (not e!85994))))

(assert (=> b!129773 (= res!107503 (bvslt from!447 to!404))))

(declare-fun b!129774 () Bool)

(assert (=> b!129774 (= e!85991 (invariant!0 (currentBit!5834 thiss!1634) (currentByte!5839 thiss!1634) (size!2720 (buf!3078 (_2!5857 lt!200320)))))))

(declare-fun b!129775 () Bool)

(assert (=> b!129775 (= e!85999 true)))

(declare-fun lt!200322 () tuple2!11124)

(assert (=> b!129775 (= lt!200322 (readBytePure!0 (BitStream!4705 (buf!3078 (_2!5857 lt!200321)) (currentByte!5839 thiss!1634) (currentBit!5834 thiss!1634))))))

(declare-fun lt!200318 () tuple2!11124)

(assert (=> b!129775 (= lt!200318 (readBytePure!0 (BitStream!4705 (buf!3078 (_2!5857 lt!200320)) (currentByte!5839 thiss!1634) (currentBit!5834 thiss!1634))))))

(declare-fun b!129776 () Bool)

(assert (=> b!129776 (= e!86000 e!85993)))

(declare-fun res!107504 () Bool)

(assert (=> b!129776 (=> (not res!107504) (not e!85993))))

(declare-fun lt!200315 () (_ BitVec 64))

(assert (=> b!129776 (= res!107504 (= (bitIndex!0 (size!2720 (buf!3078 (_2!5857 lt!200321))) (currentByte!5839 (_2!5857 lt!200321)) (currentBit!5834 (_2!5857 lt!200321))) (bvadd (bitIndex!0 (size!2720 (buf!3078 (_2!5857 lt!200320))) (currentByte!5839 (_2!5857 lt!200320)) (currentBit!5834 (_2!5857 lt!200320))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200315))))))

(assert (=> b!129776 (= lt!200315 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!107511 () Bool)

(assert (=> start!25524 (=> (not res!107511) (not e!85994))))

(assert (=> start!25524 (= res!107511 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2720 arr!237))))))

(assert (=> start!25524 e!85994))

(assert (=> start!25524 true))

(assert (=> start!25524 (array_inv!2509 arr!237)))

(declare-fun inv!12 (BitStream!4704) Bool)

(assert (=> start!25524 (and (inv!12 thiss!1634) e!85998)))

(declare-fun b!129766 () Bool)

(assert (=> b!129766 (= e!85993 (not e!85995))))

(declare-fun res!107510 () Bool)

(assert (=> b!129766 (=> res!107510 e!85995)))

(declare-fun lt!200317 () tuple2!11122)

(assert (=> b!129766 (= res!107510 (or (not (= (size!2720 (_2!5856 lt!200319)) (size!2720 arr!237))) (not (= (_1!5856 lt!200319) (_2!5858 lt!200317)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4704 array!6009 (_ BitVec 32) (_ BitVec 32)) tuple2!11118)

(assert (=> b!129766 (= lt!200319 (readByteArrayLoopPure!0 (_1!5858 lt!200317) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129766 (validate_offset_bits!1 ((_ sign_extend 32) (size!2720 (buf!3078 (_2!5857 lt!200321)))) ((_ sign_extend 32) (currentByte!5839 (_2!5857 lt!200320))) ((_ sign_extend 32) (currentBit!5834 (_2!5857 lt!200320))) lt!200315)))

(declare-fun lt!200326 () Unit!8045)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4704 array!6009 (_ BitVec 64)) Unit!8045)

(assert (=> b!129766 (= lt!200326 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5857 lt!200320) (buf!3078 (_2!5857 lt!200321)) lt!200315))))

(assert (=> b!129766 (= lt!200317 (reader!0 (_2!5857 lt!200320) (_2!5857 lt!200321)))))

(assert (= (and start!25524 res!107511) b!129761))

(assert (= (and b!129761 res!107508) b!129773))

(assert (= (and b!129773 res!107503) b!129768))

(assert (= (and b!129768 res!107506) b!129769))

(assert (= (and b!129769 res!107507) b!129770))

(assert (= (and b!129770 res!107505) b!129763))

(assert (= (and b!129763 res!107512) b!129764))

(assert (= (and b!129769 res!107500) b!129776))

(assert (= (and b!129776 res!107504) b!129772))

(assert (= (and b!129772 res!107498) b!129766))

(assert (= (and b!129766 (not res!107510)) b!129762))

(assert (= (and b!129769 res!107499) b!129774))

(assert (= (and b!129769 (not res!107502)) b!129765))

(assert (= (and b!129765 (not res!107509)) b!129767))

(assert (= (and b!129767 (not res!107501)) b!129775))

(assert (= start!25524 b!129771))

(declare-fun m!195665 () Bool)

(assert (=> b!129766 m!195665))

(declare-fun m!195667 () Bool)

(assert (=> b!129766 m!195667))

(declare-fun m!195669 () Bool)

(assert (=> b!129766 m!195669))

(declare-fun m!195671 () Bool)

(assert (=> b!129766 m!195671))

(declare-fun m!195673 () Bool)

(assert (=> b!129772 m!195673))

(declare-fun m!195675 () Bool)

(assert (=> b!129769 m!195675))

(declare-fun m!195677 () Bool)

(assert (=> b!129769 m!195677))

(declare-fun m!195679 () Bool)

(assert (=> b!129769 m!195679))

(declare-fun m!195681 () Bool)

(assert (=> b!129769 m!195681))

(declare-fun m!195683 () Bool)

(assert (=> b!129769 m!195683))

(declare-fun m!195685 () Bool)

(assert (=> b!129769 m!195685))

(declare-fun m!195687 () Bool)

(assert (=> b!129769 m!195687))

(declare-fun m!195689 () Bool)

(assert (=> b!129769 m!195689))

(assert (=> b!129769 m!195687))

(assert (=> b!129764 m!195687))

(declare-fun m!195691 () Bool)

(assert (=> b!129764 m!195691))

(declare-fun m!195693 () Bool)

(assert (=> b!129764 m!195693))

(declare-fun m!195695 () Bool)

(assert (=> b!129774 m!195695))

(declare-fun m!195697 () Bool)

(assert (=> b!129765 m!195697))

(declare-fun m!195699 () Bool)

(assert (=> b!129763 m!195699))

(declare-fun m!195701 () Bool)

(assert (=> b!129768 m!195701))

(declare-fun m!195703 () Bool)

(assert (=> b!129761 m!195703))

(declare-fun m!195705 () Bool)

(assert (=> b!129770 m!195705))

(declare-fun m!195707 () Bool)

(assert (=> b!129770 m!195707))

(declare-fun m!195709 () Bool)

(assert (=> b!129762 m!195709))

(assert (=> b!129776 m!195697))

(assert (=> b!129776 m!195705))

(declare-fun m!195711 () Bool)

(assert (=> b!129771 m!195711))

(declare-fun m!195713 () Bool)

(assert (=> b!129767 m!195713))

(declare-fun m!195715 () Bool)

(assert (=> b!129775 m!195715))

(declare-fun m!195717 () Bool)

(assert (=> b!129775 m!195717))

(declare-fun m!195719 () Bool)

(assert (=> start!25524 m!195719))

(declare-fun m!195721 () Bool)

(assert (=> start!25524 m!195721))

(check-sat (not b!129771) (not b!129776) (not b!129769) (not b!129763) (not b!129762) (not b!129775) (not b!129772) (not b!129774) (not b!129764) (not b!129768) (not start!25524) (not b!129770) (not b!129765) (not b!129761) (not b!129766) (not b!129767))
