; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25538 () Bool)

(assert start!25538)

(declare-fun b!130063 () Bool)

(declare-fun e!86209 () Bool)

(declare-datatypes ((array!6023 0))(
  ( (array!6024 (arr!3344 (Array (_ BitVec 32) (_ BitVec 8))) (size!2727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4718 0))(
  ( (BitStream!4719 (buf!3085 array!6023) (currentByte!5846 (_ BitVec 32)) (currentBit!5841 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4718)

(declare-datatypes ((Unit!8059 0))(
  ( (Unit!8060) )
))
(declare-datatypes ((tuple2!11174 0))(
  ( (tuple2!11175 (_1!5884 Unit!8059) (_2!5884 BitStream!4718)) )
))
(declare-fun lt!200617 () tuple2!11174)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130063 (= e!86209 (invariant!0 (currentBit!5841 thiss!1634) (currentByte!5846 thiss!1634) (size!2727 (buf!3085 (_2!5884 lt!200617)))))))

(declare-fun b!130064 () Bool)

(declare-fun res!107780 () Bool)

(declare-fun e!86206 () Bool)

(assert (=> b!130064 (=> (not res!107780) (not e!86206))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130064 (= res!107780 (= (bitIndex!0 (size!2727 (buf!3085 (_2!5884 lt!200617))) (currentByte!5846 (_2!5884 lt!200617)) (currentBit!5841 (_2!5884 lt!200617))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2727 (buf!3085 thiss!1634)) (currentByte!5846 thiss!1634) (currentBit!5841 thiss!1634)))))))

(declare-fun b!130065 () Bool)

(declare-fun res!107787 () Bool)

(declare-fun e!86205 () Bool)

(assert (=> b!130065 (=> (not res!107787) (not e!86205))))

(declare-fun lt!200616 () tuple2!11174)

(declare-fun isPrefixOf!0 (BitStream!4718 BitStream!4718) Bool)

(assert (=> b!130065 (= res!107787 (isPrefixOf!0 (_2!5884 lt!200617) (_2!5884 lt!200616)))))

(declare-fun b!130066 () Bool)

(declare-fun e!86203 () Bool)

(declare-fun array_inv!2516 (array!6023) Bool)

(assert (=> b!130066 (= e!86203 (array_inv!2516 (buf!3085 thiss!1634)))))

(declare-fun res!107790 () Bool)

(declare-fun e!86202 () Bool)

(assert (=> start!25538 (=> (not res!107790) (not e!86202))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6023)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25538 (= res!107790 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2727 arr!237))))))

(assert (=> start!25538 e!86202))

(assert (=> start!25538 true))

(assert (=> start!25538 (array_inv!2516 arr!237)))

(declare-fun inv!12 (BitStream!4718) Bool)

(assert (=> start!25538 (and (inv!12 thiss!1634) e!86203)))

(declare-fun b!130067 () Bool)

(declare-fun res!107779 () Bool)

(assert (=> b!130067 (=> (not res!107779) (not e!86206))))

(assert (=> b!130067 (= res!107779 (isPrefixOf!0 thiss!1634 (_2!5884 lt!200617)))))

(declare-fun b!130068 () Bool)

(declare-fun e!86204 () Bool)

(assert (=> b!130068 (= e!86204 e!86205)))

(declare-fun res!107781 () Bool)

(assert (=> b!130068 (=> (not res!107781) (not e!86205))))

(declare-fun lt!200615 () (_ BitVec 64))

(assert (=> b!130068 (= res!107781 (= (bitIndex!0 (size!2727 (buf!3085 (_2!5884 lt!200616))) (currentByte!5846 (_2!5884 lt!200616)) (currentBit!5841 (_2!5884 lt!200616))) (bvadd (bitIndex!0 (size!2727 (buf!3085 (_2!5884 lt!200617))) (currentByte!5846 (_2!5884 lt!200617)) (currentBit!5841 (_2!5884 lt!200617))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200615))))))

(assert (=> b!130068 (= lt!200615 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130069 () Bool)

(declare-fun res!107788 () Bool)

(assert (=> b!130069 (=> (not res!107788) (not e!86202))))

(assert (=> b!130069 (= res!107788 (bvslt from!447 to!404))))

(declare-fun b!130070 () Bool)

(assert (=> b!130070 (= e!86202 (not (isPrefixOf!0 (_2!5884 lt!200617) (_2!5884 lt!200616))))))

(declare-datatypes ((tuple2!11176 0))(
  ( (tuple2!11177 (_1!5885 BitStream!4718) (_2!5885 BitStream!4718)) )
))
(declare-fun lt!200620 () tuple2!11176)

(declare-fun reader!0 (BitStream!4718 BitStream!4718) tuple2!11176)

(assert (=> b!130070 (= lt!200620 (reader!0 thiss!1634 (_2!5884 lt!200616)))))

(declare-fun e!86210 () Bool)

(assert (=> b!130070 e!86210))

(declare-fun res!107791 () Bool)

(assert (=> b!130070 (=> (not res!107791) (not e!86210))))

(declare-datatypes ((tuple2!11178 0))(
  ( (tuple2!11179 (_1!5886 BitStream!4718) (_2!5886 (_ BitVec 8))) )
))
(declare-fun lt!200627 () tuple2!11178)

(declare-fun lt!200614 () tuple2!11178)

(assert (=> b!130070 (= res!107791 (= (bitIndex!0 (size!2727 (buf!3085 (_1!5886 lt!200627))) (currentByte!5846 (_1!5886 lt!200627)) (currentBit!5841 (_1!5886 lt!200627))) (bitIndex!0 (size!2727 (buf!3085 (_1!5886 lt!200614))) (currentByte!5846 (_1!5886 lt!200614)) (currentBit!5841 (_1!5886 lt!200614)))))))

(declare-fun lt!200619 () Unit!8059)

(declare-fun lt!200613 () BitStream!4718)

(declare-fun readBytePrefixLemma!0 (BitStream!4718 BitStream!4718) Unit!8059)

(assert (=> b!130070 (= lt!200619 (readBytePrefixLemma!0 lt!200613 (_2!5884 lt!200616)))))

(declare-fun readBytePure!0 (BitStream!4718) tuple2!11178)

(assert (=> b!130070 (= lt!200614 (readBytePure!0 (BitStream!4719 (buf!3085 (_2!5884 lt!200616)) (currentByte!5846 thiss!1634) (currentBit!5841 thiss!1634))))))

(assert (=> b!130070 (= lt!200627 (readBytePure!0 lt!200613))))

(assert (=> b!130070 (= lt!200613 (BitStream!4719 (buf!3085 (_2!5884 lt!200617)) (currentByte!5846 thiss!1634) (currentBit!5841 thiss!1634)))))

(assert (=> b!130070 e!86209))

(declare-fun res!107783 () Bool)

(assert (=> b!130070 (=> (not res!107783) (not e!86209))))

(assert (=> b!130070 (= res!107783 (isPrefixOf!0 thiss!1634 (_2!5884 lt!200616)))))

(declare-fun lt!200618 () Unit!8059)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4718 BitStream!4718 BitStream!4718) Unit!8059)

(assert (=> b!130070 (= lt!200618 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5884 lt!200617) (_2!5884 lt!200616)))))

(assert (=> b!130070 e!86204))

(declare-fun res!107785 () Bool)

(assert (=> b!130070 (=> (not res!107785) (not e!86204))))

(assert (=> b!130070 (= res!107785 (= (size!2727 (buf!3085 (_2!5884 lt!200617))) (size!2727 (buf!3085 (_2!5884 lt!200616)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4718 array!6023 (_ BitVec 32) (_ BitVec 32)) tuple2!11174)

(assert (=> b!130070 (= lt!200616 (appendByteArrayLoop!0 (_2!5884 lt!200617) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130070 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2727 (buf!3085 (_2!5884 lt!200617)))) ((_ sign_extend 32) (currentByte!5846 (_2!5884 lt!200617))) ((_ sign_extend 32) (currentBit!5841 (_2!5884 lt!200617))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200623 () Unit!8059)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4718 BitStream!4718 (_ BitVec 64) (_ BitVec 32)) Unit!8059)

(assert (=> b!130070 (= lt!200623 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5884 lt!200617) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130070 e!86206))

(declare-fun res!107786 () Bool)

(assert (=> b!130070 (=> (not res!107786) (not e!86206))))

(assert (=> b!130070 (= res!107786 (= (size!2727 (buf!3085 thiss!1634)) (size!2727 (buf!3085 (_2!5884 lt!200617)))))))

(declare-fun appendByte!0 (BitStream!4718 (_ BitVec 8)) tuple2!11174)

(assert (=> b!130070 (= lt!200617 (appendByte!0 thiss!1634 (select (arr!3344 arr!237) from!447)))))

(declare-fun b!130071 () Bool)

(declare-fun res!107782 () Bool)

(assert (=> b!130071 (=> (not res!107782) (not e!86202))))

(assert (=> b!130071 (= res!107782 (invariant!0 (currentBit!5841 thiss!1634) (currentByte!5846 thiss!1634) (size!2727 (buf!3085 thiss!1634))))))

(declare-fun b!130072 () Bool)

(declare-fun e!86208 () Bool)

(assert (=> b!130072 (= e!86205 (not e!86208))))

(declare-fun res!107789 () Bool)

(assert (=> b!130072 (=> res!107789 e!86208)))

(declare-datatypes ((tuple2!11180 0))(
  ( (tuple2!11181 (_1!5887 BitStream!4718) (_2!5887 array!6023)) )
))
(declare-fun lt!200624 () tuple2!11180)

(declare-fun lt!200621 () tuple2!11176)

(assert (=> b!130072 (= res!107789 (or (not (= (size!2727 (_2!5887 lt!200624)) (size!2727 arr!237))) (not (= (_1!5887 lt!200624) (_2!5885 lt!200621)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4718 array!6023 (_ BitVec 32) (_ BitVec 32)) tuple2!11180)

(assert (=> b!130072 (= lt!200624 (readByteArrayLoopPure!0 (_1!5885 lt!200621) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130072 (validate_offset_bits!1 ((_ sign_extend 32) (size!2727 (buf!3085 (_2!5884 lt!200616)))) ((_ sign_extend 32) (currentByte!5846 (_2!5884 lt!200617))) ((_ sign_extend 32) (currentBit!5841 (_2!5884 lt!200617))) lt!200615)))

(declare-fun lt!200625 () Unit!8059)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4718 array!6023 (_ BitVec 64)) Unit!8059)

(assert (=> b!130072 (= lt!200625 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5884 lt!200617) (buf!3085 (_2!5884 lt!200616)) lt!200615))))

(assert (=> b!130072 (= lt!200621 (reader!0 (_2!5884 lt!200617) (_2!5884 lt!200616)))))

(declare-fun b!130073 () Bool)

(declare-fun arrayRangesEq!130 (array!6023 array!6023 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130073 (= e!86208 (not (arrayRangesEq!130 arr!237 (_2!5887 lt!200624) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130074 () Bool)

(assert (=> b!130074 (= e!86210 (= (_2!5886 lt!200627) (_2!5886 lt!200614)))))

(declare-fun b!130075 () Bool)

(declare-fun res!107784 () Bool)

(assert (=> b!130075 (=> (not res!107784) (not e!86202))))

(assert (=> b!130075 (= res!107784 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2727 (buf!3085 thiss!1634))) ((_ sign_extend 32) (currentByte!5846 thiss!1634)) ((_ sign_extend 32) (currentBit!5841 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!200626 () tuple2!11178)

(declare-fun lt!200622 () tuple2!11176)

(declare-fun b!130076 () Bool)

(assert (=> b!130076 (= e!86206 (and (= (_2!5886 lt!200626) (select (arr!3344 arr!237) from!447)) (= (_1!5886 lt!200626) (_2!5885 lt!200622))))))

(assert (=> b!130076 (= lt!200626 (readBytePure!0 (_1!5885 lt!200622)))))

(assert (=> b!130076 (= lt!200622 (reader!0 thiss!1634 (_2!5884 lt!200617)))))

(assert (= (and start!25538 res!107790) b!130075))

(assert (= (and b!130075 res!107784) b!130069))

(assert (= (and b!130069 res!107788) b!130071))

(assert (= (and b!130071 res!107782) b!130070))

(assert (= (and b!130070 res!107786) b!130064))

(assert (= (and b!130064 res!107780) b!130067))

(assert (= (and b!130067 res!107779) b!130076))

(assert (= (and b!130070 res!107785) b!130068))

(assert (= (and b!130068 res!107781) b!130065))

(assert (= (and b!130065 res!107787) b!130072))

(assert (= (and b!130072 (not res!107789)) b!130073))

(assert (= (and b!130070 res!107783) b!130063))

(assert (= (and b!130070 res!107791) b!130074))

(assert (= start!25538 b!130066))

(declare-fun m!196085 () Bool)

(assert (=> b!130071 m!196085))

(declare-fun m!196087 () Bool)

(assert (=> b!130067 m!196087))

(declare-fun m!196089 () Bool)

(assert (=> b!130065 m!196089))

(declare-fun m!196091 () Bool)

(assert (=> b!130073 m!196091))

(declare-fun m!196093 () Bool)

(assert (=> b!130076 m!196093))

(declare-fun m!196095 () Bool)

(assert (=> b!130076 m!196095))

(declare-fun m!196097 () Bool)

(assert (=> b!130076 m!196097))

(declare-fun m!196099 () Bool)

(assert (=> start!25538 m!196099))

(declare-fun m!196101 () Bool)

(assert (=> start!25538 m!196101))

(declare-fun m!196103 () Bool)

(assert (=> b!130075 m!196103))

(declare-fun m!196105 () Bool)

(assert (=> b!130066 m!196105))

(declare-fun m!196107 () Bool)

(assert (=> b!130068 m!196107))

(declare-fun m!196109 () Bool)

(assert (=> b!130068 m!196109))

(declare-fun m!196111 () Bool)

(assert (=> b!130070 m!196111))

(declare-fun m!196113 () Bool)

(assert (=> b!130070 m!196113))

(declare-fun m!196115 () Bool)

(assert (=> b!130070 m!196115))

(declare-fun m!196117 () Bool)

(assert (=> b!130070 m!196117))

(declare-fun m!196119 () Bool)

(assert (=> b!130070 m!196119))

(declare-fun m!196121 () Bool)

(assert (=> b!130070 m!196121))

(declare-fun m!196123 () Bool)

(assert (=> b!130070 m!196123))

(assert (=> b!130070 m!196093))

(declare-fun m!196125 () Bool)

(assert (=> b!130070 m!196125))

(declare-fun m!196127 () Bool)

(assert (=> b!130070 m!196127))

(declare-fun m!196129 () Bool)

(assert (=> b!130070 m!196129))

(assert (=> b!130070 m!196089))

(declare-fun m!196131 () Bool)

(assert (=> b!130070 m!196131))

(assert (=> b!130070 m!196093))

(declare-fun m!196133 () Bool)

(assert (=> b!130070 m!196133))

(declare-fun m!196135 () Bool)

(assert (=> b!130063 m!196135))

(assert (=> b!130064 m!196109))

(declare-fun m!196137 () Bool)

(assert (=> b!130064 m!196137))

(declare-fun m!196139 () Bool)

(assert (=> b!130072 m!196139))

(declare-fun m!196141 () Bool)

(assert (=> b!130072 m!196141))

(declare-fun m!196143 () Bool)

(assert (=> b!130072 m!196143))

(declare-fun m!196145 () Bool)

(assert (=> b!130072 m!196145))

(push 1)

(assert (not b!130071))

(assert (not b!130072))

(assert (not b!130068))

(assert (not b!130073))

(assert (not b!130065))

(assert (not b!130070))

(assert (not b!130075))

(assert (not start!25538))

(assert (not b!130066))

(assert (not b!130067))

(assert (not b!130064))

(assert (not b!130063))

(assert (not b!130076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

