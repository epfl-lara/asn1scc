; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45670 () Bool)

(assert start!45670)

(declare-fun b!220794 () Bool)

(declare-fun e!149940 () Bool)

(declare-datatypes ((array!10783 0))(
  ( (array!10784 (arr!5665 (Array (_ BitVec 32) (_ BitVec 8))) (size!4735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8578 0))(
  ( (BitStream!8579 (buf!5282 array!10783) (currentByte!9918 (_ BitVec 32)) (currentBit!9913 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8578)

(declare-fun array_inv!4476 (array!10783) Bool)

(assert (=> b!220794 (= e!149940 (array_inv!4476 (buf!5282 bs!62)))))

(declare-fun b!220795 () Bool)

(declare-fun e!149939 () Bool)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220795 (= e!149939 (and (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000))) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))))

(declare-fun e!149938 () (_ BitVec 64))

(declare-datatypes ((tuple2!18932 0))(
  ( (tuple2!18933 (_1!10124 BitStream!8578) (_2!10124 (_ BitVec 64))) )
))
(declare-fun lt!348632 () tuple2!18932)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18932)

(declare-fun withMovedBitIndex!0 (BitStream!8578 (_ BitVec 64)) BitStream!8578)

(assert (=> b!220795 (= lt!348632 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!149938)))))

(declare-fun c!10679 () Bool)

(declare-datatypes ((tuple2!18934 0))(
  ( (tuple2!18935 (_1!10125 BitStream!8578) (_2!10125 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8578) tuple2!18934)

(assert (=> b!220795 (= c!10679 (_2!10125 (readBitPure!0 bs!62)))))

(declare-fun lt!348631 () tuple2!18932)

(assert (=> b!220795 (= lt!348631 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220796 () Bool)

(assert (=> b!220796 (= e!149938 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun res!185984 () Bool)

(assert (=> start!45670 (=> (not res!185984) (not e!149939))))

(assert (=> start!45670 (= res!185984 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45670 e!149939))

(assert (=> start!45670 true))

(declare-fun inv!12 (BitStream!8578) Bool)

(assert (=> start!45670 (and (inv!12 bs!62) e!149940)))

(declare-fun b!220797 () Bool)

(assert (=> b!220797 (= e!149938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220798 () Bool)

(declare-fun res!185985 () Bool)

(assert (=> b!220798 (=> (not res!185985) (not e!149939))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220798 (= res!185985 (validate_offset_bits!1 ((_ sign_extend 32) (size!4735 (buf!5282 bs!62))) ((_ sign_extend 32) (currentByte!9918 bs!62)) ((_ sign_extend 32) (currentBit!9913 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220799 () Bool)

(declare-fun res!185986 () Bool)

(assert (=> b!220799 (=> (not res!185986) (not e!149939))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220799 (= res!185986 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220800 () Bool)

(declare-fun res!185987 () Bool)

(assert (=> b!220800 (=> (not res!185987) (not e!149939))))

(assert (=> b!220800 (= res!185987 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(assert (= (and start!45670 res!185984) b!220798))

(assert (= (and b!220798 res!185985) b!220799))

(assert (= (and b!220799 res!185986) b!220800))

(assert (= (and b!220800 res!185987) b!220795))

(assert (= (and b!220795 c!10679) b!220796))

(assert (= (and b!220795 (not c!10679)) b!220797))

(assert (= start!45670 b!220794))

(declare-fun m!339475 () Bool)

(assert (=> start!45670 m!339475))

(declare-fun m!339477 () Bool)

(assert (=> b!220794 m!339477))

(declare-fun m!339479 () Bool)

(assert (=> b!220795 m!339479))

(assert (=> b!220795 m!339479))

(declare-fun m!339481 () Bool)

(assert (=> b!220795 m!339481))

(declare-fun m!339483 () Bool)

(assert (=> b!220795 m!339483))

(declare-fun m!339485 () Bool)

(assert (=> b!220795 m!339485))

(declare-fun m!339487 () Bool)

(assert (=> b!220799 m!339487))

(declare-fun m!339489 () Bool)

(assert (=> b!220798 m!339489))

(push 1)

(assert (not b!220798))

(assert (not start!45670))

(assert (not b!220795))

(assert (not b!220794))

(assert (not b!220799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

