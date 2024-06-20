; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50628 () Bool)

(assert start!50628)

(declare-fun res!197939 () Bool)

(declare-fun e!163716 () Bool)

(assert (=> start!50628 (=> (not res!197939) (not e!163716))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50628 (= res!197939 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50628 e!163716))

(assert (=> start!50628 true))

(declare-datatypes ((array!12563 0))(
  ( (array!12564 (arr!6501 (Array (_ BitVec 32) (_ BitVec 8))) (size!5514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9992 0))(
  ( (BitStream!9993 (buf!5989 array!12563) (currentByte!11154 (_ BitVec 32)) (currentBit!11149 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9992)

(declare-fun e!163715 () Bool)

(declare-fun inv!12 (BitStream!9992) Bool)

(assert (=> start!50628 (and (inv!12 thiss!1830) e!163715)))

(declare-fun b!236807 () Bool)

(declare-fun e!163718 () Bool)

(assert (=> b!236807 (= e!163716 e!163718)))

(declare-fun res!197943 () Bool)

(assert (=> b!236807 (=> (not res!197943) (not e!163718))))

(declare-datatypes ((tuple2!19996 0))(
  ( (tuple2!19997 (_1!10902 Bool) (_2!10902 BitStream!9992)) )
))
(declare-fun lt!372327 () tuple2!19996)

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!19998 0))(
  ( (tuple2!19999 (_1!10903 (_ BitVec 64)) (_2!10903 BitStream!9992)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19998)

(assert (=> b!236807 (= res!197943 (= (buf!5989 (_2!10903 (readNLeastSignificantBitsLoop!0 (_2!10902 lt!372327) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10902 lt!372327) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!5989 thiss!1830)))))

(declare-fun readBit!0 (BitStream!9992) tuple2!19996)

(assert (=> b!236807 (= lt!372327 (readBit!0 thiss!1830))))

(declare-fun b!236808 () Bool)

(declare-fun res!197938 () Bool)

(assert (=> b!236808 (=> (not res!197938) (not e!163716))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236808 (= res!197938 (validate_offset_bits!1 ((_ sign_extend 32) (size!5514 (buf!5989 thiss!1830))) ((_ sign_extend 32) (currentByte!11154 thiss!1830)) ((_ sign_extend 32) (currentBit!11149 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236809 () Bool)

(declare-fun res!197940 () Bool)

(assert (=> b!236809 (=> (not res!197940) (not e!163716))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236809 (= res!197940 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236810 () Bool)

(declare-fun array_inv!5255 (array!12563) Bool)

(assert (=> b!236810 (= e!163715 (array_inv!5255 (buf!5989 thiss!1830)))))

(declare-fun b!236811 () Bool)

(declare-fun res!197942 () Bool)

(assert (=> b!236811 (=> (not res!197942) (not e!163716))))

(assert (=> b!236811 (= res!197942 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236812 () Bool)

(declare-fun res!197941 () Bool)

(assert (=> b!236812 (=> (not res!197941) (not e!163716))))

(assert (=> b!236812 (= res!197941 (not (= nBits!581 i!752)))))

(declare-fun b!236813 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236813 (= e!163718 (not (invariant!0 (currentBit!11149 thiss!1830) (currentByte!11154 thiss!1830) (size!5514 (buf!5989 thiss!1830)))))))

(assert (= (and start!50628 res!197939) b!236808))

(assert (= (and b!236808 res!197938) b!236811))

(assert (= (and b!236811 res!197942) b!236809))

(assert (= (and b!236809 res!197940) b!236812))

(assert (= (and b!236812 res!197941) b!236807))

(assert (= (and b!236807 res!197943) b!236813))

(assert (= start!50628 b!236810))

(declare-fun m!359411 () Bool)

(assert (=> b!236808 m!359411))

(declare-fun m!359413 () Bool)

(assert (=> b!236810 m!359413))

(declare-fun m!359415 () Bool)

(assert (=> b!236807 m!359415))

(declare-fun m!359417 () Bool)

(assert (=> b!236807 m!359417))

(declare-fun m!359419 () Bool)

(assert (=> start!50628 m!359419))

(declare-fun m!359421 () Bool)

(assert (=> b!236809 m!359421))

(declare-fun m!359423 () Bool)

(assert (=> b!236813 m!359423))

(declare-fun m!359425 () Bool)

(assert (=> b!236811 m!359425))

(push 1)

(assert (not b!236811))

(assert (not b!236807))

(assert (not start!50628))

(assert (not b!236808))

(assert (not b!236809))

(assert (not b!236810))

(assert (not b!236813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80040 () Bool)

(assert (=> d!80040 (= (invariant!0 (currentBit!11149 thiss!1830) (currentByte!11154 thiss!1830) (size!5514 (buf!5989 thiss!1830))) (and (bvsge (currentBit!11149 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11149 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11154 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11154 thiss!1830) (size!5514 (buf!5989 thiss!1830))) (and (= (currentBit!11149 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11154 thiss!1830) (size!5514 (buf!5989 thiss!1830)))))))))

