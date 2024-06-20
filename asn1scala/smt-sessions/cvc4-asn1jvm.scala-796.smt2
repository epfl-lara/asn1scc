; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22998 () Bool)

(assert start!22998)

(declare-fun res!96519 () Bool)

(declare-fun e!76519 () Bool)

(assert (=> start!22998 (=> (not res!96519) (not e!76519))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22998 (= res!96519 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22998 e!76519))

(assert (=> start!22998 true))

(declare-datatypes ((array!5262 0))(
  ( (array!5263 (arr!2981 (Array (_ BitVec 32) (_ BitVec 8))) (size!2388 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4250 0))(
  ( (BitStream!4251 (buf!2798 array!5262) (currentByte!5435 (_ BitVec 32)) (currentBit!5430 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4250)

(declare-fun e!76515 () Bool)

(declare-fun inv!12 (BitStream!4250) Bool)

(assert (=> start!22998 (and (inv!12 thiss!1305) e!76515)))

(declare-fun b!116702 () Bool)

(declare-fun e!76520 () Bool)

(declare-datatypes ((tuple2!9704 0))(
  ( (tuple2!9705 (_1!5117 BitStream!4250) (_2!5117 Bool)) )
))
(declare-fun lt!178313 () tuple2!9704)

(declare-fun lt!178311 () tuple2!9704)

(assert (=> b!116702 (= e!76520 (= (_2!5117 lt!178313) (_2!5117 lt!178311)))))

(declare-fun b!116703 () Bool)

(declare-fun res!96518 () Bool)

(declare-fun e!76516 () Bool)

(assert (=> b!116703 (=> (not res!96518) (not e!76516))))

(declare-datatypes ((Unit!7181 0))(
  ( (Unit!7182) )
))
(declare-datatypes ((tuple2!9706 0))(
  ( (tuple2!9707 (_1!5118 Unit!7181) (_2!5118 BitStream!4250)) )
))
(declare-fun lt!178323 () tuple2!9706)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116703 (= res!96518 (invariant!0 (currentBit!5430 thiss!1305) (currentByte!5435 thiss!1305) (size!2388 (buf!2798 (_2!5118 lt!178323)))))))

(declare-fun lt!178322 () (_ BitVec 32))

(declare-fun b!116704 () Bool)

(declare-fun e!76521 () Bool)

(assert (=> b!116704 (= e!76521 (not (or (= lt!178322 #b00000000000000000000000000000000) (= lt!178322 (bvand (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!116704 (= lt!178322 (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9708 0))(
  ( (tuple2!9709 (_1!5119 BitStream!4250) (_2!5119 (_ BitVec 64))) )
))
(declare-fun lt!178326 () tuple2!9708)

(declare-datatypes ((tuple2!9710 0))(
  ( (tuple2!9711 (_1!5120 BitStream!4250) (_2!5120 BitStream!4250)) )
))
(declare-fun lt!178317 () tuple2!9710)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9708)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116704 (= lt!178326 (readNLeastSignificantBitsLoopPure!0 (_1!5120 lt!178317) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!178312 () tuple2!9706)

(declare-fun lt!178319 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116704 (validate_offset_bits!1 ((_ sign_extend 32) (size!2388 (buf!2798 (_2!5118 lt!178312)))) ((_ sign_extend 32) (currentByte!5435 thiss!1305)) ((_ sign_extend 32) (currentBit!5430 thiss!1305)) lt!178319)))

(declare-fun lt!178310 () Unit!7181)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4250 array!5262 (_ BitVec 64)) Unit!7181)

(assert (=> b!116704 (= lt!178310 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2798 (_2!5118 lt!178312)) lt!178319))))

(declare-fun lt!178325 () Bool)

(declare-fun readBitPure!0 (BitStream!4250) tuple2!9704)

(assert (=> b!116704 (= (_2!5117 (readBitPure!0 (_1!5120 lt!178317))) lt!178325)))

(declare-fun lt!178315 () tuple2!9710)

(declare-fun reader!0 (BitStream!4250 BitStream!4250) tuple2!9710)

(assert (=> b!116704 (= lt!178315 (reader!0 (_2!5118 lt!178323) (_2!5118 lt!178312)))))

(assert (=> b!116704 (= lt!178317 (reader!0 thiss!1305 (_2!5118 lt!178312)))))

(assert (=> b!116704 e!76520))

(declare-fun res!96517 () Bool)

(assert (=> b!116704 (=> (not res!96517) (not e!76520))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116704 (= res!96517 (= (bitIndex!0 (size!2388 (buf!2798 (_1!5117 lt!178313))) (currentByte!5435 (_1!5117 lt!178313)) (currentBit!5430 (_1!5117 lt!178313))) (bitIndex!0 (size!2388 (buf!2798 (_1!5117 lt!178311))) (currentByte!5435 (_1!5117 lt!178311)) (currentBit!5430 (_1!5117 lt!178311)))))))

(declare-fun lt!178318 () Unit!7181)

(declare-fun lt!178320 () BitStream!4250)

(declare-fun readBitPrefixLemma!0 (BitStream!4250 BitStream!4250) Unit!7181)

(assert (=> b!116704 (= lt!178318 (readBitPrefixLemma!0 lt!178320 (_2!5118 lt!178312)))))

(assert (=> b!116704 (= lt!178311 (readBitPure!0 (BitStream!4251 (buf!2798 (_2!5118 lt!178312)) (currentByte!5435 thiss!1305) (currentBit!5430 thiss!1305))))))

(assert (=> b!116704 (= lt!178313 (readBitPure!0 lt!178320))))

(assert (=> b!116704 (= lt!178320 (BitStream!4251 (buf!2798 (_2!5118 lt!178323)) (currentByte!5435 thiss!1305) (currentBit!5430 thiss!1305)))))

(assert (=> b!116704 e!76516))

(declare-fun res!96514 () Bool)

(assert (=> b!116704 (=> (not res!96514) (not e!76516))))

(declare-fun isPrefixOf!0 (BitStream!4250 BitStream!4250) Bool)

(assert (=> b!116704 (= res!96514 (isPrefixOf!0 thiss!1305 (_2!5118 lt!178312)))))

(declare-fun lt!178316 () Unit!7181)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4250 BitStream!4250 BitStream!4250) Unit!7181)

(assert (=> b!116704 (= lt!178316 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5118 lt!178323) (_2!5118 lt!178312)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4250 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9706)

(assert (=> b!116704 (= lt!178312 (appendNLeastSignificantBitsLoop!0 (_2!5118 lt!178323) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76514 () Bool)

(assert (=> b!116704 e!76514))

(declare-fun res!96515 () Bool)

(assert (=> b!116704 (=> (not res!96515) (not e!76514))))

(assert (=> b!116704 (= res!96515 (= (size!2388 (buf!2798 thiss!1305)) (size!2388 (buf!2798 (_2!5118 lt!178323)))))))

(declare-fun appendBit!0 (BitStream!4250 Bool) tuple2!9706)

(assert (=> b!116704 (= lt!178323 (appendBit!0 thiss!1305 lt!178325))))

(assert (=> b!116704 (= lt!178325 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116705 () Bool)

(declare-fun res!96516 () Bool)

(assert (=> b!116705 (=> (not res!96516) (not e!76521))))

(assert (=> b!116705 (= res!96516 (bvslt i!615 nBits!396))))

(declare-fun b!116706 () Bool)

(declare-fun e!76513 () Bool)

(declare-fun lt!178314 () tuple2!9704)

(declare-fun lt!178321 () (_ BitVec 64))

(assert (=> b!116706 (= e!76513 (= (bitIndex!0 (size!2388 (buf!2798 (_1!5117 lt!178314))) (currentByte!5435 (_1!5117 lt!178314)) (currentBit!5430 (_1!5117 lt!178314))) lt!178321))))

(declare-fun b!116707 () Bool)

(declare-fun array_inv!2190 (array!5262) Bool)

(assert (=> b!116707 (= e!76515 (array_inv!2190 (buf!2798 thiss!1305)))))

(declare-fun b!116708 () Bool)

(declare-fun res!96522 () Bool)

(assert (=> b!116708 (=> (not res!96522) (not e!76521))))

(assert (=> b!116708 (= res!96522 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116709 () Bool)

(declare-fun res!96512 () Bool)

(declare-fun e!76518 () Bool)

(assert (=> b!116709 (=> (not res!96512) (not e!76518))))

(assert (=> b!116709 (= res!96512 (isPrefixOf!0 thiss!1305 (_2!5118 lt!178323)))))

(declare-fun b!116710 () Bool)

(assert (=> b!116710 (= e!76518 e!76513)))

(declare-fun res!96521 () Bool)

(assert (=> b!116710 (=> (not res!96521) (not e!76513))))

(assert (=> b!116710 (= res!96521 (and (= (_2!5117 lt!178314) lt!178325) (= (_1!5117 lt!178314) (_2!5118 lt!178323))))))

(declare-fun readerFrom!0 (BitStream!4250 (_ BitVec 32) (_ BitVec 32)) BitStream!4250)

(assert (=> b!116710 (= lt!178314 (readBitPure!0 (readerFrom!0 (_2!5118 lt!178323) (currentBit!5430 thiss!1305) (currentByte!5435 thiss!1305))))))

(declare-fun b!116711 () Bool)

(assert (=> b!116711 (= e!76514 e!76518)))

(declare-fun res!96513 () Bool)

(assert (=> b!116711 (=> (not res!96513) (not e!76518))))

(declare-fun lt!178324 () (_ BitVec 64))

(assert (=> b!116711 (= res!96513 (= lt!178321 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178324)))))

(assert (=> b!116711 (= lt!178321 (bitIndex!0 (size!2388 (buf!2798 (_2!5118 lt!178323))) (currentByte!5435 (_2!5118 lt!178323)) (currentBit!5430 (_2!5118 lt!178323))))))

(assert (=> b!116711 (= lt!178324 (bitIndex!0 (size!2388 (buf!2798 thiss!1305)) (currentByte!5435 thiss!1305) (currentBit!5430 thiss!1305)))))

(declare-fun b!116712 () Bool)

(assert (=> b!116712 (= e!76519 e!76521)))

(declare-fun res!96520 () Bool)

(assert (=> b!116712 (=> (not res!96520) (not e!76521))))

(assert (=> b!116712 (= res!96520 (validate_offset_bits!1 ((_ sign_extend 32) (size!2388 (buf!2798 thiss!1305))) ((_ sign_extend 32) (currentByte!5435 thiss!1305)) ((_ sign_extend 32) (currentBit!5430 thiss!1305)) lt!178319))))

(assert (=> b!116712 (= lt!178319 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116713 () Bool)

(assert (=> b!116713 (= e!76516 (invariant!0 (currentBit!5430 thiss!1305) (currentByte!5435 thiss!1305) (size!2388 (buf!2798 (_2!5118 lt!178312)))))))

(assert (= (and start!22998 res!96519) b!116712))

(assert (= (and b!116712 res!96520) b!116708))

(assert (= (and b!116708 res!96522) b!116705))

(assert (= (and b!116705 res!96516) b!116704))

(assert (= (and b!116704 res!96515) b!116711))

(assert (= (and b!116711 res!96513) b!116709))

(assert (= (and b!116709 res!96512) b!116710))

(assert (= (and b!116710 res!96521) b!116706))

(assert (= (and b!116704 res!96514) b!116703))

(assert (= (and b!116703 res!96518) b!116713))

(assert (= (and b!116704 res!96517) b!116702))

(assert (= start!22998 b!116707))

(declare-fun m!174771 () Bool)

(assert (=> b!116707 m!174771))

(declare-fun m!174773 () Bool)

(assert (=> b!116703 m!174773))

(declare-fun m!174775 () Bool)

(assert (=> b!116704 m!174775))

(declare-fun m!174777 () Bool)

(assert (=> b!116704 m!174777))

(declare-fun m!174779 () Bool)

(assert (=> b!116704 m!174779))

(declare-fun m!174781 () Bool)

(assert (=> b!116704 m!174781))

(declare-fun m!174783 () Bool)

(assert (=> b!116704 m!174783))

(declare-fun m!174785 () Bool)

(assert (=> b!116704 m!174785))

(declare-fun m!174787 () Bool)

(assert (=> b!116704 m!174787))

(declare-fun m!174789 () Bool)

(assert (=> b!116704 m!174789))

(declare-fun m!174791 () Bool)

(assert (=> b!116704 m!174791))

(declare-fun m!174793 () Bool)

(assert (=> b!116704 m!174793))

(declare-fun m!174795 () Bool)

(assert (=> b!116704 m!174795))

(declare-fun m!174797 () Bool)

(assert (=> b!116704 m!174797))

(declare-fun m!174799 () Bool)

(assert (=> b!116704 m!174799))

(declare-fun m!174801 () Bool)

(assert (=> b!116704 m!174801))

(declare-fun m!174803 () Bool)

(assert (=> b!116704 m!174803))

(declare-fun m!174805 () Bool)

(assert (=> b!116704 m!174805))

(declare-fun m!174807 () Bool)

(assert (=> b!116709 m!174807))

(declare-fun m!174809 () Bool)

(assert (=> b!116711 m!174809))

(declare-fun m!174811 () Bool)

(assert (=> b!116711 m!174811))

(declare-fun m!174813 () Bool)

(assert (=> b!116706 m!174813))

(declare-fun m!174815 () Bool)

(assert (=> b!116710 m!174815))

(assert (=> b!116710 m!174815))

(declare-fun m!174817 () Bool)

(assert (=> b!116710 m!174817))

(declare-fun m!174819 () Bool)

(assert (=> b!116713 m!174819))

(declare-fun m!174821 () Bool)

(assert (=> start!22998 m!174821))

(declare-fun m!174823 () Bool)

(assert (=> b!116708 m!174823))

(declare-fun m!174825 () Bool)

(assert (=> b!116712 m!174825))

(push 1)

(assert (not b!116704))

(assert (not b!116712))

(assert (not b!116707))

(assert (not b!116706))

(assert (not b!116703))

(assert (not b!116708))

(assert (not start!22998))

(assert (not b!116713))

(assert (not b!116709))

(assert (not b!116711))

(assert (not b!116710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

