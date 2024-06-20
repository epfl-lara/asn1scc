; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64430 () Bool)

(assert start!64430)

(declare-fun res!238916 () Bool)

(declare-fun e!205667 () Bool)

(assert (=> start!64430 (=> (not res!238916) (not e!205667))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17097 0))(
  ( (array!17098 (arr!8391 (Array (_ BitVec 32) (_ BitVec 8))) (size!7395 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17097)

(assert (=> start!64430 (= res!238916 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7395 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64430 e!205667))

(declare-datatypes ((BitStream!12800 0))(
  ( (BitStream!12801 (buf!7461 array!17097) (currentByte!13856 (_ BitVec 32)) (currentBit!13851 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12800)

(declare-fun e!205671 () Bool)

(declare-fun inv!12 (BitStream!12800) Bool)

(assert (=> start!64430 (and (inv!12 thiss!1728) e!205671)))

(assert (=> start!64430 true))

(declare-fun array_inv!7007 (array!17097) Bool)

(assert (=> start!64430 (array_inv!7007 arr!273)))

(declare-fun b!289145 () Bool)

(declare-fun e!205669 () Bool)

(assert (=> b!289145 (= e!205667 e!205669)))

(declare-fun res!238915 () Bool)

(assert (=> b!289145 (=> (not res!238915) (not e!205669))))

(declare-datatypes ((tuple2!22648 0))(
  ( (tuple2!22649 (_1!12518 Bool) (_2!12518 BitStream!12800)) )
))
(declare-fun lt!419010 () tuple2!22648)

(assert (=> b!289145 (= res!238915 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7395 (buf!7461 thiss!1728)) (size!7395 (buf!7461 (_2!12518 lt!419010))))))))

(declare-fun readBit!0 (BitStream!12800) tuple2!22648)

(assert (=> b!289145 (= lt!419010 (readBit!0 thiss!1728))))

(declare-fun b!289146 () Bool)

(declare-fun res!238914 () Bool)

(assert (=> b!289146 (=> (not res!238914) (not e!205667))))

(assert (=> b!289146 (= res!238914 (bvslt from!505 to!474))))

(declare-fun b!289147 () Bool)

(declare-fun res!238913 () Bool)

(assert (=> b!289147 (=> (not res!238913) (not e!205667))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289147 (= res!238913 (validate_offset_bits!1 ((_ sign_extend 32) (size!7395 (buf!7461 thiss!1728))) ((_ sign_extend 32) (currentByte!13856 thiss!1728)) ((_ sign_extend 32) (currentBit!13851 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289148 () Bool)

(assert (=> b!289148 (= e!205671 (array_inv!7007 (buf!7461 thiss!1728)))))

(declare-fun b!289149 () Bool)

(assert (=> b!289149 (= e!205669 false)))

(declare-fun lt!419008 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289149 (= lt!419008 (bitIndex!0 (size!7395 (buf!7461 (_2!12518 lt!419010))) (currentByte!13856 (_2!12518 lt!419010)) (currentBit!13851 (_2!12518 lt!419010))))))

(declare-fun lt!419009 () (_ BitVec 64))

(assert (=> b!289149 (= lt!419009 (bitIndex!0 (size!7395 (buf!7461 thiss!1728)) (currentByte!13856 thiss!1728) (currentBit!13851 thiss!1728)))))

(assert (= (and start!64430 res!238916) b!289147))

(assert (= (and b!289147 res!238913) b!289146))

(assert (= (and b!289146 res!238914) b!289145))

(assert (= (and b!289145 res!238915) b!289149))

(assert (= start!64430 b!289148))

(declare-fun m!421859 () Bool)

(assert (=> b!289149 m!421859))

(declare-fun m!421861 () Bool)

(assert (=> b!289149 m!421861))

(declare-fun m!421863 () Bool)

(assert (=> start!64430 m!421863))

(declare-fun m!421865 () Bool)

(assert (=> start!64430 m!421865))

(declare-fun m!421867 () Bool)

(assert (=> b!289148 m!421867))

(declare-fun m!421869 () Bool)

(assert (=> b!289147 m!421869))

(declare-fun m!421871 () Bool)

(assert (=> b!289145 m!421871))

(push 1)

(assert (not start!64430))

(assert (not b!289147))

(assert (not b!289148))

(assert (not b!289145))

(assert (not b!289149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

