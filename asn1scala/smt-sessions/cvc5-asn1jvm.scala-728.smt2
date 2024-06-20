; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20344 () Bool)

(assert start!20344)

(declare-fun b!102174 () Bool)

(declare-fun e!66835 () Bool)

(declare-fun e!66838 () Bool)

(assert (=> b!102174 (= e!66835 e!66838)))

(declare-fun res!83991 () Bool)

(assert (=> b!102174 (=> (not res!83991) (not e!66838))))

(declare-fun lt!148655 () (_ BitVec 64))

(declare-fun lt!148658 () (_ BitVec 64))

(assert (=> b!102174 (= res!83991 (= lt!148655 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148658)))))

(declare-datatypes ((array!4788 0))(
  ( (array!4789 (arr!2778 (Array (_ BitVec 32) (_ BitVec 8))) (size!2185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3844 0))(
  ( (BitStream!3845 (buf!2545 array!4788) (currentByte!5018 (_ BitVec 32)) (currentBit!5013 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6266 0))(
  ( (Unit!6267) )
))
(declare-datatypes ((tuple2!8302 0))(
  ( (tuple2!8303 (_1!4406 Unit!6266) (_2!4406 BitStream!3844)) )
))
(declare-fun lt!148653 () tuple2!8302)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102174 (= lt!148655 (bitIndex!0 (size!2185 (buf!2545 (_2!4406 lt!148653))) (currentByte!5018 (_2!4406 lt!148653)) (currentBit!5013 (_2!4406 lt!148653))))))

(declare-fun thiss!1305 () BitStream!3844)

(assert (=> b!102174 (= lt!148658 (bitIndex!0 (size!2185 (buf!2545 thiss!1305)) (currentByte!5018 thiss!1305) (currentBit!5013 thiss!1305)))))

(declare-fun b!102175 () Bool)

(declare-fun e!66840 () Bool)

(declare-fun array_inv!1987 (array!4788) Bool)

(assert (=> b!102175 (= e!66840 (array_inv!1987 (buf!2545 thiss!1305)))))

(declare-fun b!102176 () Bool)

(declare-fun e!66833 () Bool)

(assert (=> b!102176 (= e!66833 (not true))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8304 0))(
  ( (tuple2!8305 (_1!4407 BitStream!3844) (_2!4407 BitStream!3844)) )
))
(declare-fun lt!148652 () tuple2!8304)

(declare-datatypes ((tuple2!8306 0))(
  ( (tuple2!8307 (_1!4408 BitStream!3844) (_2!4408 (_ BitVec 64))) )
))
(declare-fun lt!148660 () tuple2!8306)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8306)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102176 (= lt!148660 (readNLeastSignificantBitsLoopPure!0 (_1!4407 lt!148652) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!148648 () tuple2!8302)

(declare-fun lt!148657 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102176 (validate_offset_bits!1 ((_ sign_extend 32) (size!2185 (buf!2545 (_2!4406 lt!148648)))) ((_ sign_extend 32) (currentByte!5018 thiss!1305)) ((_ sign_extend 32) (currentBit!5013 thiss!1305)) lt!148657)))

(declare-fun lt!148645 () Unit!6266)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3844 array!4788 (_ BitVec 64)) Unit!6266)

(assert (=> b!102176 (= lt!148645 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2545 (_2!4406 lt!148648)) lt!148657))))

(declare-fun lt!148651 () Bool)

(declare-datatypes ((tuple2!8308 0))(
  ( (tuple2!8309 (_1!4409 BitStream!3844) (_2!4409 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3844) tuple2!8308)

(assert (=> b!102176 (= (_2!4409 (readBitPure!0 (_1!4407 lt!148652))) lt!148651)))

(declare-fun lt!148659 () tuple2!8304)

(declare-fun reader!0 (BitStream!3844 BitStream!3844) tuple2!8304)

(assert (=> b!102176 (= lt!148659 (reader!0 (_2!4406 lt!148653) (_2!4406 lt!148648)))))

(assert (=> b!102176 (= lt!148652 (reader!0 thiss!1305 (_2!4406 lt!148648)))))

(declare-fun e!66832 () Bool)

(assert (=> b!102176 e!66832))

(declare-fun res!83996 () Bool)

(assert (=> b!102176 (=> (not res!83996) (not e!66832))))

(declare-fun lt!148650 () tuple2!8308)

(declare-fun lt!148656 () tuple2!8308)

(assert (=> b!102176 (= res!83996 (= (bitIndex!0 (size!2185 (buf!2545 (_1!4409 lt!148650))) (currentByte!5018 (_1!4409 lt!148650)) (currentBit!5013 (_1!4409 lt!148650))) (bitIndex!0 (size!2185 (buf!2545 (_1!4409 lt!148656))) (currentByte!5018 (_1!4409 lt!148656)) (currentBit!5013 (_1!4409 lt!148656)))))))

(declare-fun lt!148647 () Unit!6266)

(declare-fun lt!148654 () BitStream!3844)

(declare-fun readBitPrefixLemma!0 (BitStream!3844 BitStream!3844) Unit!6266)

(assert (=> b!102176 (= lt!148647 (readBitPrefixLemma!0 lt!148654 (_2!4406 lt!148648)))))

(assert (=> b!102176 (= lt!148656 (readBitPure!0 (BitStream!3845 (buf!2545 (_2!4406 lt!148648)) (currentByte!5018 thiss!1305) (currentBit!5013 thiss!1305))))))

(assert (=> b!102176 (= lt!148650 (readBitPure!0 lt!148654))))

(assert (=> b!102176 (= lt!148654 (BitStream!3845 (buf!2545 (_2!4406 lt!148653)) (currentByte!5018 thiss!1305) (currentBit!5013 thiss!1305)))))

(declare-fun e!66837 () Bool)

(assert (=> b!102176 e!66837))

(declare-fun res!83989 () Bool)

(assert (=> b!102176 (=> (not res!83989) (not e!66837))))

(declare-fun isPrefixOf!0 (BitStream!3844 BitStream!3844) Bool)

(assert (=> b!102176 (= res!83989 (isPrefixOf!0 thiss!1305 (_2!4406 lt!148648)))))

(declare-fun lt!148646 () Unit!6266)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3844 BitStream!3844 BitStream!3844) Unit!6266)

(assert (=> b!102176 (= lt!148646 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4406 lt!148653) (_2!4406 lt!148648)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3844 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8302)

(assert (=> b!102176 (= lt!148648 (appendNLeastSignificantBitsLoop!0 (_2!4406 lt!148653) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102176 e!66835))

(declare-fun res!83993 () Bool)

(assert (=> b!102176 (=> (not res!83993) (not e!66835))))

(assert (=> b!102176 (= res!83993 (= (size!2185 (buf!2545 thiss!1305)) (size!2185 (buf!2545 (_2!4406 lt!148653)))))))

(declare-fun appendBit!0 (BitStream!3844 Bool) tuple2!8302)

(assert (=> b!102176 (= lt!148653 (appendBit!0 thiss!1305 lt!148651))))

(assert (=> b!102176 (= lt!148651 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102177 () Bool)

(assert (=> b!102177 (= e!66832 (= (_2!4409 lt!148650) (_2!4409 lt!148656)))))

(declare-fun b!102178 () Bool)

(declare-fun e!66836 () Bool)

(assert (=> b!102178 (= e!66836 e!66833)))

(declare-fun res!83998 () Bool)

(assert (=> b!102178 (=> (not res!83998) (not e!66833))))

(assert (=> b!102178 (= res!83998 (validate_offset_bits!1 ((_ sign_extend 32) (size!2185 (buf!2545 thiss!1305))) ((_ sign_extend 32) (currentByte!5018 thiss!1305)) ((_ sign_extend 32) (currentBit!5013 thiss!1305)) lt!148657))))

(assert (=> b!102178 (= lt!148657 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!83990 () Bool)

(assert (=> start!20344 (=> (not res!83990) (not e!66836))))

(assert (=> start!20344 (= res!83990 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20344 e!66836))

(assert (=> start!20344 true))

(declare-fun inv!12 (BitStream!3844) Bool)

(assert (=> start!20344 (and (inv!12 thiss!1305) e!66840)))

(declare-fun b!102179 () Bool)

(declare-fun e!66834 () Bool)

(assert (=> b!102179 (= e!66838 e!66834)))

(declare-fun res!83997 () Bool)

(assert (=> b!102179 (=> (not res!83997) (not e!66834))))

(declare-fun lt!148649 () tuple2!8308)

(assert (=> b!102179 (= res!83997 (and (= (_2!4409 lt!148649) lt!148651) (= (_1!4409 lt!148649) (_2!4406 lt!148653))))))

(declare-fun readerFrom!0 (BitStream!3844 (_ BitVec 32) (_ BitVec 32)) BitStream!3844)

(assert (=> b!102179 (= lt!148649 (readBitPure!0 (readerFrom!0 (_2!4406 lt!148653) (currentBit!5013 thiss!1305) (currentByte!5018 thiss!1305))))))

(declare-fun b!102180 () Bool)

(declare-fun res!83995 () Bool)

(assert (=> b!102180 (=> (not res!83995) (not e!66838))))

(assert (=> b!102180 (= res!83995 (isPrefixOf!0 thiss!1305 (_2!4406 lt!148653)))))

(declare-fun b!102181 () Bool)

(declare-fun res!83999 () Bool)

(assert (=> b!102181 (=> (not res!83999) (not e!66833))))

(assert (=> b!102181 (= res!83999 (bvslt i!615 nBits!396))))

(declare-fun b!102182 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102182 (= e!66837 (invariant!0 (currentBit!5013 thiss!1305) (currentByte!5018 thiss!1305) (size!2185 (buf!2545 (_2!4406 lt!148648)))))))

(declare-fun b!102183 () Bool)

(declare-fun res!83992 () Bool)

(assert (=> b!102183 (=> (not res!83992) (not e!66837))))

(assert (=> b!102183 (= res!83992 (invariant!0 (currentBit!5013 thiss!1305) (currentByte!5018 thiss!1305) (size!2185 (buf!2545 (_2!4406 lt!148653)))))))

(declare-fun b!102184 () Bool)

(declare-fun res!83994 () Bool)

(assert (=> b!102184 (=> (not res!83994) (not e!66833))))

(assert (=> b!102184 (= res!83994 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102185 () Bool)

(assert (=> b!102185 (= e!66834 (= (bitIndex!0 (size!2185 (buf!2545 (_1!4409 lt!148649))) (currentByte!5018 (_1!4409 lt!148649)) (currentBit!5013 (_1!4409 lt!148649))) lt!148655))))

(assert (= (and start!20344 res!83990) b!102178))

(assert (= (and b!102178 res!83998) b!102184))

(assert (= (and b!102184 res!83994) b!102181))

(assert (= (and b!102181 res!83999) b!102176))

(assert (= (and b!102176 res!83993) b!102174))

(assert (= (and b!102174 res!83991) b!102180))

(assert (= (and b!102180 res!83995) b!102179))

(assert (= (and b!102179 res!83997) b!102185))

(assert (= (and b!102176 res!83989) b!102183))

(assert (= (and b!102183 res!83992) b!102182))

(assert (= (and b!102176 res!83996) b!102177))

(assert (= start!20344 b!102175))

(declare-fun m!148771 () Bool)

(assert (=> b!102180 m!148771))

(declare-fun m!148773 () Bool)

(assert (=> b!102184 m!148773))

(declare-fun m!148775 () Bool)

(assert (=> b!102179 m!148775))

(assert (=> b!102179 m!148775))

(declare-fun m!148777 () Bool)

(assert (=> b!102179 m!148777))

(declare-fun m!148779 () Bool)

(assert (=> b!102178 m!148779))

(declare-fun m!148781 () Bool)

(assert (=> b!102185 m!148781))

(declare-fun m!148783 () Bool)

(assert (=> b!102182 m!148783))

(declare-fun m!148785 () Bool)

(assert (=> b!102174 m!148785))

(declare-fun m!148787 () Bool)

(assert (=> b!102174 m!148787))

(declare-fun m!148789 () Bool)

(assert (=> b!102183 m!148789))

(declare-fun m!148791 () Bool)

(assert (=> b!102176 m!148791))

(declare-fun m!148793 () Bool)

(assert (=> b!102176 m!148793))

(declare-fun m!148795 () Bool)

(assert (=> b!102176 m!148795))

(declare-fun m!148797 () Bool)

(assert (=> b!102176 m!148797))

(declare-fun m!148799 () Bool)

(assert (=> b!102176 m!148799))

(declare-fun m!148801 () Bool)

(assert (=> b!102176 m!148801))

(declare-fun m!148803 () Bool)

(assert (=> b!102176 m!148803))

(declare-fun m!148805 () Bool)

(assert (=> b!102176 m!148805))

(declare-fun m!148807 () Bool)

(assert (=> b!102176 m!148807))

(declare-fun m!148809 () Bool)

(assert (=> b!102176 m!148809))

(declare-fun m!148811 () Bool)

(assert (=> b!102176 m!148811))

(declare-fun m!148813 () Bool)

(assert (=> b!102176 m!148813))

(declare-fun m!148815 () Bool)

(assert (=> b!102176 m!148815))

(declare-fun m!148817 () Bool)

(assert (=> b!102176 m!148817))

(declare-fun m!148819 () Bool)

(assert (=> b!102176 m!148819))

(declare-fun m!148821 () Bool)

(assert (=> b!102176 m!148821))

(declare-fun m!148823 () Bool)

(assert (=> start!20344 m!148823))

(declare-fun m!148825 () Bool)

(assert (=> b!102175 m!148825))

(push 1)

(assert (not b!102184))

(assert (not b!102176))

(assert (not b!102180))

(assert (not b!102179))

(assert (not b!102182))

(assert (not b!102185))

(assert (not b!102178))

(assert (not start!20344))

(assert (not b!102175))

(assert (not b!102174))

(assert (not b!102183))

(check-sat)

(pop 1)

