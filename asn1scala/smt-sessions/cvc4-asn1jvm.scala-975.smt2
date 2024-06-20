; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27442 () Bool)

(assert start!27442)

(declare-fun b!140965 () Bool)

(declare-fun res!117556 () Bool)

(declare-fun e!93912 () Bool)

(assert (=> b!140965 (=> (not res!117556) (not e!93912))))

(declare-datatypes ((array!6457 0))(
  ( (array!6458 (arr!3629 (Array (_ BitVec 32) (_ BitVec 8))) (size!2922 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5102 0))(
  ( (BitStream!5103 (buf!3343 array!6457) (currentByte!6203 (_ BitVec 32)) (currentBit!6198 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8826 0))(
  ( (Unit!8827) )
))
(declare-datatypes ((tuple2!12412 0))(
  ( (tuple2!12413 (_1!6536 Unit!8826) (_2!6536 BitStream!5102)) )
))
(declare-fun lt!219219 () tuple2!12412)

(declare-fun thiss!1634 () BitStream!5102)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140965 (= res!117556 (= (bitIndex!0 (size!2922 (buf!3343 (_2!6536 lt!219219))) (currentByte!6203 (_2!6536 lt!219219)) (currentBit!6198 (_2!6536 lt!219219))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2922 (buf!3343 thiss!1634)) (currentByte!6203 thiss!1634) (currentBit!6198 thiss!1634)))))))

(declare-fun res!117550 () Bool)

(declare-fun e!93911 () Bool)

(assert (=> start!27442 (=> (not res!117550) (not e!93911))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6457)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27442 (= res!117550 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2922 arr!237))))))

(assert (=> start!27442 e!93911))

(assert (=> start!27442 true))

(declare-fun array_inv!2711 (array!6457) Bool)

(assert (=> start!27442 (array_inv!2711 arr!237)))

(declare-fun e!93913 () Bool)

(declare-fun inv!12 (BitStream!5102) Bool)

(assert (=> start!27442 (and (inv!12 thiss!1634) e!93913)))

(declare-fun b!140966 () Bool)

(declare-fun res!117551 () Bool)

(assert (=> b!140966 (=> (not res!117551) (not e!93912))))

(declare-fun isPrefixOf!0 (BitStream!5102 BitStream!5102) Bool)

(assert (=> b!140966 (= res!117551 (isPrefixOf!0 thiss!1634 (_2!6536 lt!219219)))))

(declare-fun b!140967 () Bool)

(declare-fun res!117552 () Bool)

(assert (=> b!140967 (=> (not res!117552) (not e!93911))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140967 (= res!117552 (invariant!0 (currentBit!6198 thiss!1634) (currentByte!6203 thiss!1634) (size!2922 (buf!3343 thiss!1634))))))

(declare-fun b!140968 () Bool)

(declare-datatypes ((tuple2!12414 0))(
  ( (tuple2!12415 (_1!6537 BitStream!5102) (_2!6537 (_ BitVec 8))) )
))
(declare-fun lt!219221 () tuple2!12414)

(declare-datatypes ((tuple2!12416 0))(
  ( (tuple2!12417 (_1!6538 BitStream!5102) (_2!6538 BitStream!5102)) )
))
(declare-fun lt!219220 () tuple2!12416)

(assert (=> b!140968 (= e!93912 (and (= (_2!6537 lt!219221) (select (arr!3629 arr!237) from!447)) (= (_1!6537 lt!219221) (_2!6538 lt!219220))))))

(declare-fun readBytePure!0 (BitStream!5102) tuple2!12414)

(assert (=> b!140968 (= lt!219221 (readBytePure!0 (_1!6538 lt!219220)))))

(declare-fun reader!0 (BitStream!5102 BitStream!5102) tuple2!12416)

(assert (=> b!140968 (= lt!219220 (reader!0 thiss!1634 (_2!6536 lt!219219)))))

(declare-fun b!140969 () Bool)

(declare-fun res!117555 () Bool)

(assert (=> b!140969 (=> (not res!117555) (not e!93911))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140969 (= res!117555 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2922 (buf!3343 thiss!1634))) ((_ sign_extend 32) (currentByte!6203 thiss!1634)) ((_ sign_extend 32) (currentBit!6198 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140970 () Bool)

(assert (=> b!140970 (= e!93913 (array_inv!2711 (buf!3343 thiss!1634)))))

(declare-fun b!140971 () Bool)

(declare-fun res!117553 () Bool)

(assert (=> b!140971 (=> (not res!117553) (not e!93911))))

(assert (=> b!140971 (= res!117553 (bvslt from!447 to!404))))

(declare-fun b!140972 () Bool)

(assert (=> b!140972 (= e!93911 (not (or (not (= (bvand from!447 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!447 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140972 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2922 (buf!3343 (_2!6536 lt!219219)))) ((_ sign_extend 32) (currentByte!6203 (_2!6536 lt!219219))) ((_ sign_extend 32) (currentBit!6198 (_2!6536 lt!219219))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219218 () Unit!8826)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5102 BitStream!5102 (_ BitVec 64) (_ BitVec 32)) Unit!8826)

(assert (=> b!140972 (= lt!219218 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6536 lt!219219) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!140972 e!93912))

(declare-fun res!117554 () Bool)

(assert (=> b!140972 (=> (not res!117554) (not e!93912))))

(assert (=> b!140972 (= res!117554 (= (size!2922 (buf!3343 thiss!1634)) (size!2922 (buf!3343 (_2!6536 lt!219219)))))))

(declare-fun appendByte!0 (BitStream!5102 (_ BitVec 8)) tuple2!12412)

(assert (=> b!140972 (= lt!219219 (appendByte!0 thiss!1634 (select (arr!3629 arr!237) from!447)))))

(assert (= (and start!27442 res!117550) b!140969))

(assert (= (and b!140969 res!117555) b!140971))

(assert (= (and b!140971 res!117553) b!140967))

(assert (= (and b!140967 res!117552) b!140972))

(assert (= (and b!140972 res!117554) b!140965))

(assert (= (and b!140965 res!117556) b!140966))

(assert (= (and b!140966 res!117551) b!140968))

(assert (= start!27442 b!140970))

(declare-fun m!216781 () Bool)

(assert (=> b!140970 m!216781))

(declare-fun m!216783 () Bool)

(assert (=> b!140968 m!216783))

(declare-fun m!216785 () Bool)

(assert (=> b!140968 m!216785))

(declare-fun m!216787 () Bool)

(assert (=> b!140968 m!216787))

(declare-fun m!216789 () Bool)

(assert (=> b!140966 m!216789))

(declare-fun m!216791 () Bool)

(assert (=> b!140967 m!216791))

(declare-fun m!216793 () Bool)

(assert (=> b!140969 m!216793))

(declare-fun m!216795 () Bool)

(assert (=> start!27442 m!216795))

(declare-fun m!216797 () Bool)

(assert (=> start!27442 m!216797))

(declare-fun m!216799 () Bool)

(assert (=> b!140965 m!216799))

(declare-fun m!216801 () Bool)

(assert (=> b!140965 m!216801))

(declare-fun m!216803 () Bool)

(assert (=> b!140972 m!216803))

(declare-fun m!216805 () Bool)

(assert (=> b!140972 m!216805))

(assert (=> b!140972 m!216783))

(assert (=> b!140972 m!216783))

(declare-fun m!216807 () Bool)

(assert (=> b!140972 m!216807))

(push 1)

(assert (not b!140967))

(assert (not b!140966))

(assert (not b!140969))

(assert (not b!140972))

(assert (not b!140968))

(assert (not b!140970))

(assert (not start!27442))

(assert (not b!140965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

